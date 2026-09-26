using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CARE.core.members
{
    public enum Gender
    {
        Homme,
        Femme,
        Autre
    }

    public enum BoardRole
    {
        None,
        President,
        VicePresident,
        Secretaire,
        Tresorier,
        Auditeur
    }

    public class Member
    {
        // TODO : ajouter le champs GUID pour chaque membre
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        public int Age {get; set; } = 18;
        public Gender Gender { get; set; }
        public DateTime BirthDate { get; set; }
        // TODO : ajouter logique de companionId (ID accompagnant si joueur mineur)
        
        // Cotisation annuelle et rôles
        public bool HasPaidAnnualDues { get; set; }
        public BoardRole Role { get; set; } = BoardRole.None;
        public bool IsGameMaster { get; set; } // Tag MJ attribué par la secrétaire

        // Accompagnant pour les mineurs (12 à 17 ans)
        public bool IsTooYoung => Age < 12;                              // -12ans: Ne peut être membre
        public bool RequiresCompanion => Age >= 12 && Age < 18;          // 12 -> 17 ans: obligation d'avoir un accompagnant
        public bool HasValidCompanion => !RequiresCompanion || CompanionId.HasValue; // True si adulte OU mineur avec accompagnant

        // Calcul de l'âge du membre
        public int CalculateAge(DateTime referenceDate)
        {
            int age = referenceDate.Year - BirthDate.Year;
            if (BirthDate.Date > referenceDate.AddYears(-age))
            {
                age--;
            }
            return age;
        }
    }
}