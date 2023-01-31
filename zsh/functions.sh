
watcher() {
    watch -n $3 "tail -c 1000 $1 | tr '\r' '\n' | tail -n $2";
}

pyproc() {
    ps aux | grep '[p]ython\s'
}

charmproc() {
    ps aux | grep '[p]ython\s.*pycharm'
}

most_recent_file() {
    ls -Artls $1 | tail -n 1
}

most_recent_kernel_file() {
    ls -Artls ~/.jupyter/kernels | tail -n 1 | awk '{print $10}'
}

jqt_get_kernels() {
    rsync -avPz $1:~/.local/share/jupyter/runtime/ ~/.jupyter/kernels/
}

jqt_connect() {
    jupyter qtconsole \
        --style=monokai \
        --JupyterWidget.include_other_output=True \
        --ssh=$1 \
        --existing=~/.jupyter/kernels/kernel_$2.json
}
