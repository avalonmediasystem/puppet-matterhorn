class matterhorn::thirdparty {
  include epel
  include nulrepo

  package { ["jam", 
             "libjpeg-turbo", 
             "libpng", 
             "libtiff",
             "scons", 
             "SDL", 
             "zlib",]:
    ensure  => present,
    require => Class['nulrepo'],
  }
}
