const PATH = require( 'path' );
const FS = require( 'fs' );

console.log( 'TMX2BAS v1.0-0 by Baptiste Bideaux.' );
console.log( '------------------------------------' );
console.log( ' ' );

const myArgs = process.argv.slice(2);
if( myArgs.length == 0 )
{
    showHelp();
    process.exit( 0 );
}

function showHelp()
{
    console.log( 'Syntax in command line:' );
    console.log( 'tmx2bas.js <tmxfile>' );
    console.log( ' tmxfile: Absolute path of the TMX file.' );
}

var tmxFile = myArgs[ 0 ];
try
{
	var data = FS.readFileSync( tmxFile );
	var lines = data.toString().split( "\r\n" );
	if( lines )
	{
		var code = "";
		var opened = false;
		var m = 0;
		for( var l = 0; l < lines.length; l++ )
		{
			var line = lines[ l ].trim();
			if( line == '<data encoding="csv">' )
			{
				line = '';
				m++;
				code = code + "; map #" + m + "\r\n";
				code = code + "#label map" + m + "\r\n";
				opened = true;
			}

			if( line == '</data>' )
			{
				line = '';
				opened = false;
			}
			
			if( line != '' && opened )
			{
				code = code + 'DATA ' + convertData( line ) + '\r\n';
			}
		}
	}
    FS.writeFileSync( 'output.bas', code, 'utf8' );
    console.log( 'Code BASIC created in output.bas' );
	process.exit( 0 );
}
catch( e )
{
	console.log( e );
	process.exit( 1 );
}

function convertData( line )
{
	var res = '';
	var values = line.split( ',' );
	if( values )
	{
		for( var v = 0; v < values.length; v++ )
		{
			var value = -1;
			if( values != '' )
			{				
				value = parseInt( values[ v ] );
			}
			
			if( value != -1 && !isNaN( value ) )
			{
				value = value.toString( 16 );
				if( ( value.length % 2 ) > 0 )
				{
					value = "0" + value;
				}
				res = res + value.toUpperCase();
			}
		}
	}
	
	return '"' + res + '"';
}
