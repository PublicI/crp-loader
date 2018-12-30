const csv = require('csv-parser');
const map = require('through2-map');
const iconv = require('iconv-lite');

const extraSapceRegex = /\| +,\|/g;
const slashEscapeRegex = /\\/g;
const newLineEscapeRegex = /\n/g;
const tabEscapeRegex = /\t/g;

process.stdin
	.pipe(iconv.decodeStream('ISO-8859-1'))
	.pipe(map.obj(chunk => chunk.toString('utf8').replace(extraSapceRegex, '|,|')))
	.pipe(
		csv({
			quote: '|',
			headers: false,
			mapValues({ value }) {
				return value.trim() !== ''
					? value
							.trim()
							.replace(slashEscapeRegex, '\\\\')
							.replace(newLineEscapeRegex, '\\\n')
							.replace(tabEscapeRegex, '\\\t')
					: '\\N';
			}
		})
	)
	.pipe(map.obj(chunk => Object.values(chunk).join('\t') + '\n'))
	.pipe(process.stdout);
