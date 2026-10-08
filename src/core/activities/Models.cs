namespace CARE.Core.Activities;

public enum ActivityStatus
{
    Planifie,
    EnCours,
    Termine,
    Annulé
}

public class Room
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public string Name { get; set; } = string.Empty;
    
    // Maximum 2 tables par local
    public int MaxTables { get; } = 2; 
}

public class GameTable
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public string GameName { get; set; } = string.Empty; // Nom du Jeu de rôle
    public Guid GameMasterId { get; set; }
    public Guid RoomId { get; set; }
    public List<Guid> PlayerIds { get; set; } = new();

    // Règles métier
    public int MinPlayers { get; } = 3;
    public int MaxPlayers { get; } = 6;

    public bool IsFull => PlayerIds.Count >= MaxPlayers;
    public bool HasMinimumPlayers => PlayerIds.Count >= MinPlayers;
}

public class ActivitySession
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public DateTime ScheduledDate { get; set; }
    public ActivityStatus Status { get; set; } = ActivityStatus.Planifie;
    public List<GameTable> Tables { get; set; } = new();
}