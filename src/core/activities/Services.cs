using CARE.core.members;

namespace CARE.Core.Activities;

public class ActivityService
{
    // Ajouter une table à une salle (max 2 tables par local)
    public GameTable CreateTable(ActivitySession session, Room room, Member gameMaster, string gameName)
    {
        if (!gameMaster.IsGameMaster)
        {
            throw new InvalidOperationException("Seul un membre validé comme MJ peut créer une table.");
        }

        int tablesInRoom = session.Tables.Count(t => t.RoomId == room.Id);
        if (tablesInRoom >= room.MaxTables)
        {
            throw new InvalidOperationException($"La salle {room.Name} contient déjà le maximum de {room.MaxTables} tables.");
        }

        var table = new GameTable
        {
            GameName = gameName,
            GameMasterId = gameMaster.Id,
            RoomId = room.Id
        };

        session.Tables.Add(table);
        return table;
    }

    // Inscrire un joueur à une table (entre 3 et 6 joueurs)
    public void RegisterPlayerToTable(GameTable table, Member player)
    {
        if (table.PlayerIds.Contains(player.Id))
        {
            throw new InvalidOperationException("Le membre est déjà inscrit à cette table.");
        }

        if (table.IsFull)
        {
            throw new InvalidOperationException($"La table est complète (maximum {table.MaxPlayers} joueurs).");
        }

        if (table.GameMasterId == player.Id)
        {
            throw new InvalidOperationException("Le Meneur de Jeu ne peut pas être inscrit comme joueur sur sa propre table.");
        }

        // Ajouter le joueur à la table de jeu
        table.PlayerIds.Add(player.Id);
    }
}