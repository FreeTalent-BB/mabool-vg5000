const PATH = require( 'path' );
const FS = require( 'fs' );

var fileSource = undefined;
var o = "./code.bas";
var nl = 1;
var vars = [];
var labels = [];
var labelNames = {};
var vars = [];
var varNames = {};
var compress = false;
var code = '';
var lines = [];

String.prototype.strReplace = function( strSearch, strReplace )
{
	var newStr = '';
	for( n = 0; n < this.length; n++ )
	{
		var part = this.substr( n, strSearch.length );
		if( part == strSearch )
		{
			newStr = newStr + strReplace;
			n = n + ( strSearch.length - 1 );
		}
		else
		{
			newStr = newStr + part.substr( 0, 1 );
		}
	}

	return newStr;
}

function rscript( options )
{
	fileSource = options.source;
	if( fileSource == undefined )
	{
		return false;
	}
	
	compress = (options.c && options.c=="yes")?true:false;
	o = (options.o)?options.o:"./output.bas";
	
	if( !transpileFile( fileSource ) )
	{
		return false;
	}
	
	return finalizeCode();
}
exports.rscript = rscript;

var myArgs = [];
if( PATH.basename( process.argv[ 1 ] ).toLowerCase() == 'rscript.js' )
{
	console.log( 'RSCRIPT v1.0-2 by Baptiste Bideaux' );
	console.log( '----------------------------------' ); 
	console.log( '' );

	myArgs = process.argv.slice(2);
	
    fileSource = myArgs[ 0 ];
    if( !FS.existsSync( fileSource ) )
    {
        console.log( 'ERROR: ' + fileSource + ' not found.' );
        process.exit( 1 );
    }

    for( var a = 1; a < myArgs.length; a++ )
    {
        var arg = myArgs[ a ];
        if( arg.indexOf( '-' ) != 0 )
        {
            console.log( 'ERROR: Invalid argument in ' + arg );
            process.exit( 1 );
        }

        if( arg.indexOf( '=' ) < 2 )
        {
            console.log( 'ERROR: Invalid argument in ' + arg );
            process.exit( 1 );
        }
		
        var command = arg.split( '=' )[ 0 ];
        var value = arg.split( '=' )[ 1 ];
		if( value && command != '-o' )
		{
			value = value.toLowerCase();
		}		
        switch( command.toLowerCase() )
        {
            case '-o':
                o = value;
                break;
				
            case '-c':
                if( value == 'yes' )
                {
					compress = true;
                }
                break;
				
            case '-h':
				showHelp();
				process.exit( 0 );
                break;
        }
		
		if( !transpileFile( fileSource ) )
		{
			return false;
		}
		return finalizeCode();
    }
}

function checkParams()
{
	if( !FS.existsSync( PATH.dirname( o ) ) )
    {
		console.log( 'ERROR: Invalid value in "-o" argument. ' + PATH.dirname( o ) + ' path not exists.' );
        return false;
    }
	return true;
}

function finalizeCode()
{
	code = generateCode();
	if( code === false )
	{
		return false;
	}

	if( compress )
	{
		code = code.strReplace( " ", "" );
		code = code.strReplace( "_", " " );
		code = code.strReplace( "PRINT", '?' );
		code = code.strReplace( "print", '?' );
		code = code.strReplace( "Print", '?' );
	}
	
	// Verifie le code
	var lines = code.split( "\r\n" )
	if( lines )
	{
		for( var l = 0; l < lines.length; l++ )
		{
			if( ( lines[ l ].length - lines[ l ].indexOf( " " ) )  > 255 )
			{
				console.log( 'WARN: Line too long at line ' + ( l + 1 ) + ' (' + ( lines[ l ].length - lines[ l ].indexOf( " " ) ) + ' characters)' );
			}
		}
	}

	FS.writeFileSync( o, code, 'utf8' );
	console.log( 'Code BASIC created in ' +  o );
	return true;
}

function generateCode()
{
	var code = "";
	var finalLine = '';
	var added = false;
	var nl = 1;
	for( var l = 0; l < lines.length; l++ )
	{	
		var line = lines[ l ];

		if( line.substring( 0, 7 ).toLowerCase() == "#label " )
		{
			var part = line.split( " " );
			if( part.length < 2 )
			{
				console.log( 'ERROR: Label name undefined at line ' + ( l + 1 ) + ' in ' + file );
				return false;                    
			}

			var labelInfo = 
			{ 
				name: part[ 1 ],
				line: nl
			}

			if( labelNames[ labelInfo.name ] )
			{
				console.log( 'ERROR: Label name already exists at line ' + ( l + 1 ) + ' in ' + file );
				return false;                      
			}
			labels.push( labelInfo );
			labelNames[ labelInfo.name ] = true;
			line = '';
		}
		
		if( line != '' )
		{
			for( var v = 0; v < vars.length; v++ )
			{
				line = line.strReplace( '!' + vars[ v ], varNames[ vars[ v ] ].toUpperCase() );
				line = line.strReplace( '!' + vars[ v ].toUpperCase(), varNames[ vars[ v ] ].toUpperCase() );	
				line = line.strReplace( '!' + vars[ v ].toLowerCase(), varNames[ vars[ v ] ].toUpperCase() );
			}
			
			if( line.substring( line.length - 1, line.length ) == '/' )
			{

				if( finalLine != '' )
				{
					finalLine = finalLine + ':' + line.substring( 0, line.length - 1 );
				}
				else
				{
					finalLine = line.substring( 0, line.length - 1 );
				}
				added = false;
			}
			else
			{
				if( finalLine == '' )
				{
					finalLine = line;
				}
				else
				{
					finalLine = finalLine + ':' + line;						
				}
				added = true;
			}
		}
		
		if( finalLine != '' && added )
		{
			code = code + nl + " " + finalLine + "\r\n";
			finalLine = "";
			nl = nl + 1;
			added = false;
		}		
	}
	for( var l = 0; l < labels.length; l++ )
	{
		var label = labels[ l ];
		code = code.strReplace( '@' + label.name, label.line );
	}
	return code;
}


function transpileFile( file, cb )
{
	if( !checkParams() )
	{
		return false;		
	}
	
    if( !FS.existsSync( file ) )
    {
        console.log( 'ERROR: ' + file + ' not found.' );
        return false;;        
    }

    var data = FS.readFileSync( file, 'utf8' ).toString();
    var dataLines = data.split( "\r" );
	
    if( dataLines )
    {
        for( var l = 0; l < dataLines.length; l++ )
        {
            var line = dataLines[ l ];
            line = line.strReplace( "\n", "" );
            line = line.trim();
            
            if( line.substring( 0, 1 ) == ";" )
            {
                line = '';
            }
            
			if( line.substring( 0, 4 ).toLowerCase() == "rem " && compress )
            {
                line = '';
            }

			if( line.substring( 0, 1 ) == "'" && compress )
            {
                line = '';
            }
			
            if( line.substring( 0, 9 ).toLowerCase() == "#include " )
            {
                var part = line.split( " " );
                if( part.length < 2 )
                {
                    console.log( 'ERROR: File not found at line ' + ( l + 1 ) + ' in ' + file );
                    return false;                 
                }

                var incFile = PATH.dirname( file ) + "/" + part[ 1 ].strReplace( ".", "/" ) + ".rscript";
                if( !transpileFile( incFile ) )
				{
					return false;
				}
                line = '';
            }

            if( line.substring( 0, 9 ).toLowerCase() == "#tmx2bas " )
            {
                var part = line.split( " " );
                if( part.length < 2 )
                {
                    console.log( 'ERROR: #tmx2bas argument error at line ' + ( l + 1 ) + ' in ' + file );
                    return false;                    
                }
				var options = JSON.parse( '{' + part[ 1 ] + '}' );
				var { tmx2bas } = require( './tmx2bas.js' );
				if( !tmx2bas( options ) )
				{
					console.log( 'ERROR: TMX2BAS failed!' );
					return false;
				}
				line = "";
			}
			
            if( line.substring( 0, 10 ).toLowerCase() == "#img2char " )
            {
                var part = line.split( " " );
                if( part.length < 2 )
                {
                    console.log( 'ERROR: #imf2char argument error at line ' + ( l + 1 ) + ' in ' + file );
                    return false;                    
                }
				var options = JSON.parse( '{' + part[ 1 ] + '}' );
				var { img2char } = require( './img2char.js' );
				img2char( options, function( error )
				{
					if( error )
					{
						console.log( 'ERROR: IMG2CHAR failed!' );
						process.exit( 1 );
					}
				} );
				line = "";
			}
			
            if( line.substring( 0, 5 ).toLowerCase() == "#var " )
            {
                var part = line.split( " " );
                if( part.length < 2 )
                {
                    console.log( 'ERROR: Variable name undefined at line ' + ( l + 1 ) + ' in ' + file );
                    return false;                    
                }

                if( varNames[ part[ 1 ] ] )
                {
                    console.log( 'ERROR: Variable name already exists at line ' + ( l + 1 ) + ' in ' + file );
                    return false;                      
                }
				
				var letters = "abcdefghijklmnopqrstuvwxyz";
				var nums = "0123456789";
				var name = letters[ Math.round( Math.random() * 25 ) ] + nums[ Math.round(Math.random() * 9 ) ];// + letters[ Math.round( Math.random() * 25 ) ];
				if( part[ 1 ].indexOf( "$" ) > -1 )
				{
					name = name + '$';
				}
				vars.push( part[ 1 ] );
				varNames[ part[ 1 ] ] = name;
				line='';
			}

			if( line != '' )
			{
                lines.push( line );
            }

        }
    }
	return true;
}

function showHelp()
{
    console.log( 'Syntax in command line:' );
    console.log( 'rscript.js <filesource> [-h] [-o=<output>] [-c=<no|yes>]' );
    console.log( '<filesource>: Absolute path of the main source file.' );
    console.log( '-h: This help' );
    console.log( '-c: Code compression. Remove all unnecessary spaces, empty lines and the all comments. Must be "no" or "yes" ("no" by default)' );
    console.log( '-o: Output path for the generated BASIC file. (directory of the sourcefile by default)' );
}
