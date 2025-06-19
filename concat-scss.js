const fs = require('fs');
const path = require('path');
const glob = require('glob');

const outputFile = path.join(__dirname, 'assets/sass/all.scss');
const scssFiles = glob.sync('assets/sass/**/*.scss', { ignore: ['assets/sass/all.scss'] });

let output = '';
scssFiles.forEach(file => {
  output += `// ---- ${file} ----\n`;
  output += fs.readFileSync(file, 'utf8') + '\n';
});

fs.writeFileSync(outputFile, output);
console.log(`Concatenated ${scssFiles.length} files into all.scss`); 