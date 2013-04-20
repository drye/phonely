name             'phonely'
maintainer       'Phonely'
maintainer_email ''
license          'All rights reserved'
description      'Installs/Configures phonely'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports "ubuntu"

depends "build-essential"
depends "apache2"
depends "python"
depends "postgresql"
depends "php"
