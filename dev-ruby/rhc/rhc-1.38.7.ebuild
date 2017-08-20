# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby22"

inherit ruby-fakegem

DESCRIPTION="OpenShift command-line tools"
HOMEPAGE="https://github.com/openshift/rhc"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"
SLOT="0"

ruby_add_rdepend "
    dev-ruby/archive-tar-minitar
    dev-ruby/commander
    dev-ruby/highline
    dev-ruby/httpclient
    dev-ruby/net-scp
    dev-ruby/net-ssh-multi
    dev-ruby/open4
    "

ruby_fakegem_metadata_gemspec() {
    ${RUBY} -r yaml -e "puts Gem::Specification.from_yaml(File::open('${FILESDIR}/metadata', :encoding => 'UTF-8').read).to_ruby" > $2
}
