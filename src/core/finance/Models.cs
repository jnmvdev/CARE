namespace CARE.Core.Finance;

public class Ardoise
{
    public DateTime DateCreation { get; set; } = DateTime.UtcNow;
    public decimal MontantTotal { get; set; }
    public bool Payee { get; set; }
    public DateTime? DatePaiement { get; set; }
    public List<LigneArdoise> Lignes { get; set; } = new();
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