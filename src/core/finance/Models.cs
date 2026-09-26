namespace CARE.Core.Finance;

public class Ardoise
{
    // TODO : voir carte trello correspondante
}

public class LigneArdoise
{
    public string TypeLigne { get; set; } = string.Empty; // Consommation ou AvanceRepas
    public int Quantite { get; set; }
    public decimal PrixApplique { get; set; }
    public string Description { get; set; } = string.Empty;
}

public class TransactionFinanciere
{
    public DateTime DateTransaction { get; set; } = DateTime.UtcNow;
    public string Type { get; set; } = string.Empty; // Subvention, Cotisation, Vente, Depense
    public decimal Montant { get; set; }
    public string Libelle { get; set; } = string.Empty;
}

public static class TypeLigneArdoise
{
    public const string Consommation = "Consommation";
    public const string AvanceRepas = "Avance de repas";
}

public static class TypeTransaction
{
    public const string Subvention = "Subvention";
    public const string Cotisation = "Cotisation";
    public const string Vente = "Vente";
    public const string Depense = "Depense";
}