
process.env.TM_SITE_DATA = "SiteData_TM";   // used by default in TM and in unit tests

module.exports = function (wallaby) {
  process.env.NODE_PATH = require('path').join(wallaby.localProjectDir, 'code', 'TM_Website', 'node_modules');

  //console.dir(wallaby)

  return {
    files: [
             'code/TM_Jade/**/*.jade',
             'code/TM_Shared/**/*.*coffee',
             'code/TM_Static/**/*.*',
             'code/TM_Website/src/**/*.coffee',
             'config/SiteData_TM/**/*.*'
           ],

    tests: [
            //"code/TM_Website/test/**/*.coffee"
            "code/TM_Website/test/**/Jade-Service*.coffee"
           ],

    env: {
      type: 'node',
    }
  };
};