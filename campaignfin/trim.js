const csv = require('csv-parser');
const through2 = require('through2');
const dsv = require('d3-dsv');
const iconv = require('iconv-lite');

process.stdin
	.pipe(iconv.decodeStream('ISO-8859-1'))
	.pipe(
		through2.obj(function (chunk, enc, callback) {
			this.push(chunk.toString('utf8').replace(/\| +,\|/g,'|,|'));

			callback();
		})
	)
	.pipe(csv({
		quote: '|',
		headers: false,
		mapValues({ header, index, value }) {
			return value.trim()
		}
	}))
	.pipe(
		through2.obj(function (chunk, enc, callback) {
			let row = Object.values(chunk);

			// row[row.length-1] = row[row.length-1].replace('|','');

			this.push(dsv.tsvFormatRows([row]) + '\n');

			callback();
		})
	)
	.pipe(process.stdout);
