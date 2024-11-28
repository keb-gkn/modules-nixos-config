{config, ...}:
{
  home.file."${config.home.homeDirectory}.nv/nvidia-application-profiles-rc".text = ''
{
  "rules": [
    {
      "pattern": {
        "feature": "dso",
        "matches": "libGL.so.1"
      },
      "profile": "openGL_fix"
    }
  ],
  "profiles": [
    {
      "name": "openGL_fix",
      "settings": [
        {
          "key": "GLThreadedOptimizations",
          "value": false
        }
      ]
    }
  ]
}
  '';
}
