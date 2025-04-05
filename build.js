const esbuild = require('esbuild');

esbuild.build({
  entryPoints: ['app/javascript/application.js'],
  bundle: true,
  sourcemap: true,
  outdir: 'app/assets/builds',
  publicPath: 'assets'
}).then(() => console.log("Build succeeded"))
 .catch((error) => { console.error("Build failed:", error); process.exit(1); });