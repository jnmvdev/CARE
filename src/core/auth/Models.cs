namespace CARE.Core.Auth;

public class Role
{
    public string Libelle { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
}

public class RoleComite
{
    public int AnneeCivile { get; set; }
    public Role Role { get; set; } = new();
}

public static class RoleLibelles
{
    public const string President = "Président";
    public const string VicePresident = "Vice-président";
    public const string Secretaire = "Secrétaire";
    public const string Tresorier = "Trésorier";
    public const string Auditeur = "Vérificateur des comptes";
}

public static class Permissions
{
    public static bool CanAssignRoles(string roleLibelle) =>
        roleLibelle == RoleLibelles.President; // Seul le président peut attribuer des rôles

    public static bool CanManageMembers(string roleLibelle) =>
        roleLibelle is RoleLibelles.President or RoleLibelles.Secretaire;

    public static bool CanManageFinance(string roleLibelle) =>
        roleLibelle is RoleLibelles.President or RoleLibelles.Tresorier;

    public static bool CanManageStock(string roleLibelle) =>
        roleLibelle is RoleLibelles.President or RoleLibelles.Tresorier;
}