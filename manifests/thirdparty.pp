class matterhorn::thirdparty {
  include epel
  include nulrepo

  package { ["jam", "scons", "zlib", "libjpeg-turbo", "libpng", "libtiff",
    "mp4v2", "SDL", "libogg", "libvorbis", "lame", "xvidcore", "libfaac", 
    "libtheora", "libvpx",]:
    ensure  => present,
    require => [Class['nulrepo'],Class['avalon::ffmpeg']],
  }
}
