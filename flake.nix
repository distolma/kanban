{
  description = "Dev shell for the Kanban Phoenix project";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ]; # add more if needed
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f (import nixpkgs { inherit system; }));
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          buildInputs = [
            pkgs.erlang
            pkgs.elixir
            pkgs.nodejs
            pkgs.mkcert
            pkgs.openssl
          ];

          shellHook = ''
            export MIX_HOME="$PWD/.nix-mix"
            export HEX_HOME="$PWD/.nix-hex"
            export LANG=en_US.UTF-8
            export ERL_AFLAGS="-kernel shell_history enabled"
            echo "🚀  Phoenix dev shell ready – run: mix setup && mix phx.server"
          '';
        };
      });
    };
}
