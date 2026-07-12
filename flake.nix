{
  description = "tsunacan's dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager }:
    let
      # NOTE: 別のユーザー名の PC に適用する場合は、この1行だけ書き換えればよい
      # （macOS のログインユーザー名 = /Users/<username> に一致させること）
      username = "tsunacan";
    in
    {
      # ホスト名に依存しない固定名構成。適用は常に --flake .#default を指定する
      darwinConfigurations.default = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit username; };
        modules = [
          ./nix/darwin.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./nix/home.nix;
          }
        ];
      };
    };
}
