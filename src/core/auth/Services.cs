namespace CARE.Core.Auth;

public class AuthService
{
    public void AssignRole(RoleComite currentActorRole, RoleComite targetRoleAssignment)
    {
        if (!Permissions.CanAssignRoles(currentActorRole.Role.Libelle))
            throw new InvalidOperationException("Seul le Président peut attribuer les rôles.");

        // Logique d'attribution de rôle à compléter
    }

    public bool HasPermission(RoleComite memberRole, Func<string, bool> permissionCheck)
    {
        return permissionCheck(memberRole.Role.Libelle);
    }
}