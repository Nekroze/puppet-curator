# curator #

Curator is a puppet module for managing [librarian-puppet](http://librarian-puppet.com/) with puppet itself!

This module will take control (read wipe) your Puppetfile and populate it with the modules you declare as follows:

	class { 'curator':
		modules => ['puppetlabs-stdlib', 'puppetlabs-postgresql'],
		path    => '/etc/puppet', # This is the default for this parameter.
	}
	
The above example will setup [librarian-puppet](http://librarian-puppet.com/) to install the ``puppetlabs-stdlib`` and ``puppetlabs-postgresql`` modules from the forge.

This module is very simple at present (does not support; module version specification, git modules, etc.) however I am happy to take merge requests.