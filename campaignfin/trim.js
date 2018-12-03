// const csv = require('csv-parser');
// const through2 = require('through2');
// const dsv = require('d3-dsv');
const iconv = require('iconv-lite');
const { StringStream } = require('scramjet');

StringStream.from(process.stdin.pipe(iconv.decodeStream('ISO-8859-1')))
	.map(value =>
		value
			.replace(/\| +,\|/g, '|,|')
			.replace(/"/g, '""')
			.replace(/\|/g, '"')
	)
	.CSVParse({
		transform(value) {
			return value.trim() !== ''
				? value
						.trim()
						.replace(/\\/g, '\\\\')
						.replace(/\n/g, '\\\n')
						.replace(/\t/g, '\\\t')
				: // .replace(/\\\./g, '\\\\.')
				  '\\N';
		}
	})
	.map(row => row.join('\t') + '\n')
	.pipe(process.stdout);
