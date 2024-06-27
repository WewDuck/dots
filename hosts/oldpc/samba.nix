{...}:
{

services.samba = {
	enable = true;		
	securityType = "user";
	openFirewallv = true;
	extraConfig = ''
		workgroup = WORKGROUP
		server string = oldpc
		netbios name = oldpc
		security = user
	'';
	shares = {
		private = {
			path = "/mnt/samba/private";
			browsable = "yes";
			"read only" = "no";
			"guest ok" = "no";
			"create mask" = "0644";
			"directory mask" = "0755";
			"force group" = "sambaers"; 
		};
	};

};
}
