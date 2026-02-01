
# godot custom intro

used resources:

  - tv noise: https://freesound.org/people/AItF4/sounds/761332/ -- AItF4, October 24th, 2024
  - radio noise: https://freesound.org/people/ERH/sounds/30331/ -- ERH, February 2nd, 2007
  - glitch shader effect: https://godotshaders.com/shader/glitch-effect-shader/ -- arlez80, March 15, 2021

## about godot plugins

guides:

  - editor icons: https://github.com/godotengine/godot/tree/master/editor/icons
  - how to submit plugins: https://docs.godotengine.org/en/latest/community/asset_library/submitting_to_assetlib.html
  - making plugins: https://docs.godotengine.org/en/stable/tutorials/plugins/editor/making_plugins.html
  - godot asset library public review queue: https://godotengine.org/asset-library/asset/edit?max_results=500&page=0&asset=-1

### checklist

must:

  - [X] must work.
  - [X] has `.gitignore` (see [example](https://raw.githubusercontent.com/aaronfranke/gitignore/godot/Godot.gitignore)).
  - [X] no submodules.
  - [X] license file.
    - [X] repo license matches the one in the asset library.
    - [X] named `LICENSE` or `LICENSE.md`.
    - [X] contains: license text, copy right statement, year, copyright holder.
  - [X] proper English (name and description).
  - [X] icon has direct link ("raw.githubusercontent.com" not "github.com").

can:

  - [X] have files within `<git-root>/addons/asset_name/`.
  - [ ] fix or suppress all script warnings.
  - [/] use gdscript style guide (see [web](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html#doc-gdscript-styleguide)).
  - [X] screenshots.
    - [X] add screenshots to subfolder.
    - [X] screenshot subfolder has `.gdignore`
  - [X] add `.gitattributes` for excluding files and directories (with `export-ignore`)
  - [X] create copy of LICENSE and README in `<git-root>/addons/asset_name/`.
    - [X] LICENSE
    - [/] README
  - [X] host addon on Github.

submission data:

  - [X] asset name.
    - [X] unique.
    - [X] descriptive.
  - [X] category: addon (= in-editor) or project (= in-project-manager, meaning template, demo, project).
  - [X] godot version.
  - [X] asset version number.
  - [X] repo host (github, gitlab, bitbucket, codeberg).
  - [X] repo url: `https://github.com/<user>/<project>`.
  - [X] issue url: `https://github.com/<user>/<project>/issues`.
  - [ ] download git commit hash.
  - [X] url to asset icon and assetlib thumbnail.
    - [X] PNG or JPG.
    - [X] 1:1 ratio.
    - [X] minimum resolution of 128x128.
    - [X] url format: `https://raw.githubusercontent.com/<user>/<project>/<branch>/<filename>.png`
      - [X] https://raw.githubusercontent.com/kraasch/godot-glitch-intro/main/info/icon/glitch_icon.png
  - [X] license.
  - [X] description.
  - [/] videos (type, image or youtube url, thumbnail url).

#### example files

example gitignore:

```gitignore
# Godot 4+ specific ignores
.godot/
# Godot-specific ignores
.import/
export.cfg
export_presets.cfg
# Imported translations (automatically generated from CSV files)
*.translation
# Mono-specific ignores
.mono/
data_*/
mono_crash.*.json
```

example gitattributes:

```gitattributes
# Normalize line endings for all files that Git considers text files.
* text=auto eol=lf
# Only include the addons folder when downloading from the Asset Library.
/**        export-ignore
/addons    !export-ignore
/addons/** !export-ignore
```

