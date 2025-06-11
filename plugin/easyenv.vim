if exists('g:easyenv_loaded')
    finish
endif

let g:easyenv_loaded=1

command! EasyEnvCreate call easyenv#Execute('Create')
command! EasyEnvLoad call easyenv#Execute('Load')

" ***** Default Configurations *****
let g:easyenv_dotfile_config    = '.easyenv.json'
let g:easyenv_dotfile_default   =  {'environment': {}}   

let g:easyenv_manifest_config = {
  \ 'maven':          'pom.xml',
  \ 'gradle':         'build.gradle',
  \ 'gradle_kts':     'build.gradle.kts',
  \ 'sbt':            'build.sbt',
  \ 'npm':            'package.json',
  \ 'pnpm':           'pnpm-lock.yaml',
  \ 'bun':            'bun.lockb',
  \ 'poetry':         'pyproject.toml',
  \ 'pipenv':         'Pipfile',
  \ 'setuptools':     'setup.py',
  \ 'rust':           'Cargo.toml',
  \ 'go':             'go.mod',
  \ 'dotnetcs':       '*.csproj',
  \ 'dotnetfs':       '*.fsproj',
  \ 'dotnetvb':       '*.vbproj',
  \ 'cmake':          'CMakeLists.txt',
  \ 'make':           'Makefile',
  \ 'meson':          'meson.build',
  \ 'docker':         'Dockerfile',
  \ 'docker_compose': 'docker-compose.yml',
  \ 'helm':           'Chart.yaml',
  \ 'kubernetes':     '*.yaml',
  \ 'nextjs':         'next.config.js',
  \ 'vite':           'vite.config.ts',
  \ 'nuxt':           'nuxt.config.ts',
  \ 'gatsby':         'gatsby-config.js',
  \ 'sveltekit':      'svelte.config.js',
  \ 'astro':          'astro.config.mjs'
  \ }
