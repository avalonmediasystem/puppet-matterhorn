# Copyright 2011-2013, The Trustees of Indiana University and Northwestern
#   University.  Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
# 
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software distributed 
#   under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
#   CONDITIONS OF ANY KIND, either express or implied. See the License for the 
#   specific language governing permissions and limitations under the License.
# ---  END LICENSE_HEADER BLOCK  ---

class matterhorn::config (

  $matterhorn_user  = 'matterhorn',
  $matterhorn_base  = '/usr/local/matterhorn',
  $matterhorn_admin = 'library@northwestern.edu',
  $rtmp_dir         = "${avalon::info::root_dir}/rtmp_streams",
  $hls_dir          = "${avalon::info::root_dir}/hls_streams",
  $http_port        = '8080',
  $static_hls       = true,
  $solr_url         = "${avalon::info::db_url}/solr/mhorn",
  $db_host          = $avalon::info::db_address,
  $db_user          = $avalon::mysql::params::user,
  $db_password      = $avalon::mysql::params::password,
  $db_name          = 'matterhorn'
  
) {
  File { require => Class['matterhorn::install'], }
  

  file { '/etc/rc.d/init.d/matterhorn':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 0755,
    content => template("matterhorn/matterhorn_init.erb"),
  }

  file { "$matterhorn_base/etc/config.properties":
    ensure  => present,
    content => template("matterhorn/config.properties.erb"),
    owner   => 'matterhorn',
    group   => 'matterhorn',
  }

  file { "$matterhorn_base/etc/workflows/avalon-audio.xml":
    ensure  => present,
    content => template("matterhorn/avalon-audio.xml.erb"),
    owner   => 'matterhorn',
    group   => 'matterhorn',
  }

  file { "$matterhorn_base/etc/workflows/avalon-video.xml":
    ensure  => present,
    content => template("matterhorn/avalon-video.xml.erb"),
    owner   => 'matterhorn',
    group   => 'matterhorn',
  }

}
