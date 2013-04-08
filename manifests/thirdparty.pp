class matterhorn::thirdparty {
  include epel
  include nulrepo
  include mediainfo

  package { ["jam", 
             "libjpeg-turbo", 
             "libpng", 
             "libtiff",
             "scons", 
             "SDL", 
             "zlib",
             "qt_sbtl_embedder",
             "tesseract",]:
    ensure  => present,
    require => [Class['nulrepo'],Class['ffmpeg']],
  }
}
