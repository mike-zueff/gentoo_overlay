# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby24"

inherit ruby-fakegem

DESCRIPTION="OpenShift command-line tools"
HOMEPAGE="https://github.com/openshift/rhc"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"
SLOT="1"

ruby_add_rdepend "
    <=dev-ruby/commander-4.4.0
    <=dev-ruby/highline-1.7.6
    <=dev-ruby/httpclient-2.8.2.4
    >=dev-ruby/archive-tar-minitar-0
    >=dev-ruby/commander-4.0
    >=dev-ruby/highline-1.6.11
    >=dev-ruby/httpclient-2.4.0
    >=dev-ruby/net-scp-1.1.2
    >=dev-ruby/net-ssh-multi-1.2.0
    >=dev-ruby/open4-0
    "
