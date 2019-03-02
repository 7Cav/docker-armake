# Docker armake

I took inspiration from the [alpine git](https://hub.docker.com/r/alpine/git/) container, and made a quick and easy tool container so that our misson devs don't need to install armake to get working on missions.

## Usage

Simply use the following with whatever arguements and parameters you need

```
docker run -ti --rm -v ${HOME}:/root -v $(pwd):/arma 7cav/armake <args>
```

_note: on windows, replace `$(pwd)` with `${pwd}`_

### Optional setup

On *nix based systems, add this fuction to ~/.bashrc or ~/.profile

`$ cat ~/.profile`

```
function armake () {
    (docker run -ti --rm -v ${HOME}:/root -v $(pwd):/arma 7cav/armake "$@")
}
```

`$ source ~/.profile`

for example, if you need build a PBO from a git repo project with the function you just set, you can run it as local command:

```
armake build -w unquoted-string -w redefinition-wo-undef -w excessive-concatenation -x ".*" -x "*.pbo" -x "*.md" . 7Cav_FullSpectrum.Altis.pbo
```
