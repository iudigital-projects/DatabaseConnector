# Documento EA3

Documento de la evidencia de aprendizaje EA3, elaborado con Typst.

## Archivos

- `main.typ`: contenido y configuración del documento.
- `refs.yml`: referencias bibliográficas.
- `flake.nix` y `flake.lock`: entorno reproducible con Nix.
- `justfile`: tareas para compilar, previsualizar y exportar a PNG.
- `../assets/`: logo institucional e imágenes de evidencias usadas por el documento.

## Typst

[Typst](https://typst.app/) es un sistema de composición tipográfica basado en
marcado, pensado como una alternativa moderna a LaTeX. Los archivos `.typ`
describen el contenido y el formato, y se compilan a PDF con el comando
`typst compile`.

El documento usa la plantilla `versatile-apa` versión 7.2.0, disponible en el
paquete oficial de Typst Universe, que implementa el estilo APA de séptima
edición. Typst descarga automáticamente la plantilla la primera vez que se
compila el documento.

## Compilar con Nix

Desde la carpeta `document`:

```bash
nix develop path:. --command typst compile --root .. main.typ
```

Esto genera `main.pdf`. Se usa `path:.` para que Nix incluya también los
archivos nuevos del proyecto cuando aún no están confirmados en Git.

También puede entrar al entorno y usar `just`:

```bash
nix develop path:.
just build
```

Otras tareas disponibles:

```bash
just watch
just preview
just png
```

## Compilar en otras máquinas

1. Instale Typst. Algunas opciones:

   ```bash
   # Instalador oficial
   curl -fsSL https://typst.app/install.sh | sh

   # Con Cargo
   cargo install typst-cli

   # Con Homebrew (macOS/Linux)
   brew install typst
   ```

   También puede usar el paquete de su distribución Linux o descargar el
   binario desde https://github.com/typst/typst/releases.

2. Opcionalmente instale `just` para usar el `justfile`:

   ```bash
   cargo install just
   ```

3. Desde la carpeta `document`, compile:

   ```bash
   typst compile --root .. main.typ
   ```

   La opción `--root ..` es necesaria porque el documento referencia el logo y
   las evidencias desde `../assets/`.

4. Abra `main.pdf` para ver el resultado.

## Notas

- No es necesario instalar la plantilla `versatile-apa` por separado.
- Si cambia las imágenes, mantenga la misma ruta `../assets/`.
- Para previsualizar mientras edita, ejecute `typst watch --root .. main.typ`.
