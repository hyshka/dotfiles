if expand('%:p') =~# '^/home/hyshka/work/muckrack/muckrack/code/'
  let b:ale_linters = { 'python': ['flake8', 'mypy'], }
  let b:ale_python_mypy_use_global = 1
  let b:ale_python_mypy_executable = '/home/hyshka/work/muckrack/muckrack/mypy.sh'
  let b:ale_filename_mappings = {
  \ 'mypy': [
  \   ['/home/hyshka/work/muckrack/muckrack/code', '/code'],
  \ ],
  \}
endif
