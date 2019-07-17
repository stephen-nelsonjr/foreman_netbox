# ForemanNetbox

This plugin will automate the process of assigning ip addresses to Foreman hosts using the smart_proxy_netpam plugin and a netbox-provided SDK, "netbox-client-ruby".

## Installation

See [How_to_Install_a_Plugin](http://projects.theforeman.org/projects/foreman/wiki/How_to_Install_a_Plugin)
for how to install Foreman plugins

## Usage

When a new host is created on Foreman, this plugin will request a new ip address from the smart_proxy_netpam plugin, which then makes additional communications with netbox to obtain and assign an IP address to the host and send it back to Foreman.

## TODO

*Todo list here*

## Contributing

Fork and send a Pull Request. Thanks!

## Copyright

Copyright (c) *2019* *Stephen Nelson Jr*

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

