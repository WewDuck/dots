{...}:
{

services.samba = {
	enable = true;		
	settings.global.security = "user";
	openFirewall = true;
#	extraConfig = ''
#		workgroup = WORKGROUP
#		server string = oldpc
#		netbios name = oldpc
#		security = user
#	'';
	settings = {
		oldpc = {
			path = "/mnt/samba/private";
			browsable = "yes";
			"read only" = "no";
			"guest ok" = "no";
			"create mask" = "0644";
			"directory mask" = "0755";
			"force group" = "sambaers"; 
			"force user" = "JamesBond";
		};
	};

};


services.samba-wsdd = {
  enable = true;
  openFirewall = true;
};
}
