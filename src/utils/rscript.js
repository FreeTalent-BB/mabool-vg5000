const PATH = require( 'path' );
const FS = require( 'fs' );

const myArgs = process.argv.slice(2);

console.log( 'RSCRIPT v1.0-1 by Baptiste Bideaux' );
console.log( '----------------------------------' ); 
console.log( '' );

if( myArgs.length == 0 )
{
    showHelp();
    process.exit( 0 );
}

var fileSource = undefined;
var o = undefined;
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

if( myArgs.length > 0 )
{
    fileSource = myArgs[ 0 ];
    if( !FS.existsSync( fileSource ) )
    {
        console.log( 'ERROR: ' + fileSource + ' not found.' );
        process.exit( 1 );
    }

    o = PATH.dirname( fileSource );
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
        switch( command.toLowerCase() )
        {
            case '-o':
                if( !FS.existsSync( value ) )
                {
                    console.log( 'ERROR: Invalid value in "-o" argument. ' + value + ' path not exists.' );
                    process.exit( 1 );
                }
                o = value;
                break;
				
            case '-c':
                if( value.toLowerCase() == 'yes' )
                {
					compress = true;
                }
                break;				
        }
    }
}

transpileFile( fileSource );
code = '';
if( lines.length > 0 )
{
    code = lines.join( "\r\n" ) + "\r\n";
}

for( var l = 0; l < vars.length; l++ )
{
    code = code.strReplace( '!' + vars[ l ], varNames[ vars[ l ] ].toUpperCase() );
    code = code.strReplace( '!' + vars[ l ].toUpperCase(), varNames[ vars[ l ] ].toUpperCase() );	
    code = code.strReplace( '!' + vars[ l ].toLowerCase(), varNames[ vars[ l ] ].toUpperCase() );
}

for( var l = 0; l < labels.length; l++ )
{
    var label = labels[ l ];
    code = code.strReplace( '@' + label.name, label.line );
}

code = code.strReplace( '_', " " );

// Patch VG5000 Code
code = code.strReplace( 'SETEG0', "SETEG" );
code = code.strReplace( 'seteg0', "seteg" );
code = code.strReplace( 'SETET0', "SETET" );
code = code.strReplace( 'setet0', "setet" );
code = code.strReplace( "PRINT", '?' );
code = code.strReplace( "print", '?' );
code = code.strReplace( "Print", '?' );
 

// Verifie le code
var lines = code.split( "\r\n" )
if( lines )
{
	for( var l = 0; l < lines.length; l++ )
	{
		if( ( lines[ l ].length - lines[ l ].indexOf( " " ) )  > 127 )
		{
			console.log( 'WARN: Line too long at line ' + ( l + 1 ) + ' (' + ( lines[ l ].length - lines[ l ].indexOf( " " ) ) + ' characters)' );
		}
	}
}
FS.writeFileSync( o + '/CODE.BAS', code, 'utf8' );

console.log( 'Code BASIC created in ' + ( o + '/code.BAS' ) );

function transpileFile( file )
{
    if( !FS.existsSync( file ) )
    {
        console.log( 'ERROR: ' + file + ' not found.' );
        process.exit( 1 );        
    }

    var data = FS.readFileSync( file, 'utf8' ).toString();
    var dataLines = data.split( "\r" );
	var finalLine = '';
	var addLine = false;
	
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
                    process.exit( 1 );                    
                }

                var incFile = PATH.dirname( file ) + "/" + part[ 1 ].strReplace( ".", "/" ) + ".rscript";
                transpileFile( incFile );
                line = '';
            }

            if( line.substring( 0, 5 ).toLowerCase() == "#var " )
            {
                var part = line.split( " " );
                if( part.length < 2 )
                {
                    console.log( 'ERROR: Variable name undefined at line ' + ( l + 1 ) + ' in ' + file );
                    process.exit( 1 );                    
                }

                if( varNames[ part[ 1 ] ] )
                {
                    console.log( 'ERROR: Variable name already exists at line ' + ( l + 1 ) + ' in ' + file );
                    process.exit( 1 );                      
                }
				
				var letters = "abcdefghijklmnopqrstuvwxyz";
				var nums = "0123456789";
				var name = letters[ Math.round( Math.random() * 25 ) ] + nums[ Math.round(Math.random() * 9 ) ] + letters[ Math.round( Math.random() * 25 ) ];
				if( part[ 1 ].indexOf( "$" ) > -1 )
				{
					name = name + '$';
				}
				vars.push( part[ 1 ] );
				varNames[ part[ 1 ] ] = name;
				line='';
			}

            if( line.substring( 0, 7 ).toLowerCase() == "#label " )
            {
                var part = line.split( " " );
                if( part.length < 2 )
                {
                    console.log( 'ERROR: Label name undefined at line ' + ( l + 1 ) + ' in ' + file );
                    process.exit( 1 );                    
                }

                var labelInfo = 
                { 
                    name: part[ 1 ],
                    line: nl
                }

                if( labelNames[ labelInfo.name ] )
                {
                    console.log( 'ERROR: Label name already exists at line ' + ( l + 1 ) + ' in ' + file );
                    process.exit( 1 );                      
                }
                labels.push( labelInfo );
                labelNames[ labelInfo.name ] = true;
                line = '';
            }

			if( line != '' )
			{
				if( line.substring( line.length - 1, line.length ) == '/' )
				{
					if( finalLine != '' )
					{
						finalLine = finalLine + ' : ' + line.substring( 0, line.length - 1 );
						
					}
					else
					{
						finalLine = line.substring( 0, line.length - 1 );
					}
				}
				else
				{
					if( finalLine == '' )
					{
						finalLine = line;
					}
					else
					{
						finalLine = finalLine + ' : ' + line;						
					}
					addLine = true;
				}
			}

            if( finalLine != '' && addLine )
            {
				if( compress )
				{
					finalLine = finalLine.strReplace( " ", "" );
				}
                
				finalLine = nl + ' ' + finalLine;
                lines.push( finalLine );
                nl = nl + 1;
				finalLine = '';
				addLine = false;
            }

        }
    }
}

function showHelp()
{
    console.log( 'Syntax in command line:' );
    console.log( 'rscript.js <filesource> [-o=<output>]' );
    console.log( '<filesource>: Absolute path of the main source file.' );
    console.log( '-c: Code compression. Remove all unnecessary spaces and the all comments.' );
    console.log( '-o: Output path for the generated BASIC file. (directory of the sourcefile by default)' );
}
