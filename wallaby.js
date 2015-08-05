
process.env.TM_SITE_DATA = "SiteData_TM";   // used by default in TM and in unit tests

module.exports = function (wallaby) {
  process.env.NODE_PATH = require('path').join(wallaby.localProjectDir, 'code', 'TM_Website', 'node_modules');

  //console.dir(wallaby)
  console.log('[in Wallaby]');
  return {
    files: [
             'code/TM_Jade/**/*.jade',
             'code/TM_Shared/**/*.*coffee',
             'code/TM_Static/**/*.css',
             'code/TM_Static/**/*.md',
             'code/TM_Static/assets/clients/logos.jpg',
             'code/TM_Angular/build/**/*.*',
             'code/TM_Website/src/**/*.coffee',
             'data/Lib_Docs-json/Library/**/*.json',
             'data/Lib_Docs-json/Articles_Html/00000000*.json',
             'data/Lib_Docs-json/_Images/editingoverview-img2.jpg',
             'config/SiteData_TM/**/*.json',
           ],

    tests: [
            "code/TM_Website/test/**/*.coffee"
            //"code/TM_Website/test/**/Jade-Service*.coffee"
           ],

    env: {
      type: 'node',
    }
  };
};