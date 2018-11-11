# -p is used because you can rerun with --dirty to rebuild
mkdir -p workdir
cd workdir

export CFLAGS="${CFLAGS} -I${PREFIX}/include"
export CXXFLAGS="${CXXFLAGS} -I${PREFIX}/include"

cmake $SRC_DIR \
    -DCMAKE_INSTALL_PREFIX="$PREFIX" \
    -G"$CMAKE_GENERATOR" \
    -DCMAKE_BUILD_TYPE=Release \
    -Dgnuinstall=ON \
    -DCMAKE_INSTALL_LIBDIR="$SP_DIR" \
    -Dbuiltin_freetype=ON \
    -Dfftw3=ON \
    -Dgdml=OFF \
    -Dxml=OFF \
    -Dmathmore=ON \
    -Dminuit2=ON \
    -Dmysql=OFF \
    -Droofit=ON \
    -Dssl=ON \
    -Dxrootd=ON \
    -Dpython=ON \
    -Dvc=OFF \
    -DPYTHON_EXECUTABLE="$PYTHON"

cmake --build . --target install --config Release -- -j$CPU_COUNT

# cp ${PREFIX}/lib/root/libPyROOT.* ${PREFIX}/lib/python2.7/site-packages/
# cp ${PREFIX}/lib/root/ROOT.py ${PREFIX}/lib/python2.7/site-packages/
