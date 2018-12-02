const csv = require('csv-parser');
const through2 = require('through2');
const dsv = require('d3-dsv');
const iconv = require('iconv-lite');

process.stdin
	.pipe(iconv.decodeStream('ISO-8859-1'))
	.pipe(csv({
		quote: '|',
		headers: false,
		mapValues({ header, index, value }) {
			return value.trim()
		}
	}))
	.pipe(
		through2.obj(function(chunk, enc, callback) {
			this.push(dsv.csvFormatRows([Object.values(chunk)]));

			callback();
		})
	)
	.pipe(process.stdout);
