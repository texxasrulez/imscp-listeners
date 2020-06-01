# i-MSCP Listener::Dovecot::Sieve listener file
# Copyright (C) 2017 Laurent Declercq <l.declercq@nuxwin.com>
# Copyright (C) 2016-2017 Sven Jantzen <info@svenjantzen.de>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA

#
## Allows to modify dovecot.conf file.
## This listener file requires dovecot version 2.1.0 or newer.
#

package Listener::Dovecot::Sieve;

use strict;
use warnings;
use iMSCP::EventManager;

#
## Configuration variables
#

# Add values to dovecot.conf
	my %mail_plugins = (
    'sieve' => 'file:~/sieve;active=~/.dovecot.sieve',
    'mail_plugins' => '$mail_plugins sieve'
);

#
## Please, don't edit anything below this line
#


iMSCP::EventManager->getInstance()->register(
    'beforePoBuildConf',
    sub {
        my ($cfgTpl, $tplName) = @_;

        return 0 unless $tplName eq 'dovecot.conf';

        $$cfgTpl .= <<EOF;

EOF
        0;
	}
);

1;
__END__
