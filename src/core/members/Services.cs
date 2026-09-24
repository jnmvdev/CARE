namespace CARE.Core.Members;

public class MemberService
{
    // Inscription d'un membre + vérification d'âge
    public Member RegisterMember(
        string firstName, 
        string lastName, 
        Gender gender, 
        DateTime birthDate, 
        DateTime currentDate, 
        Guid? companionId = null)
    {
        var tempMember = new Member { BirthDate = birthDate };
        int age = tempMember.CalculateAge(currentDate);

        // Min. 12 ans pour être membre
        if (age < 12)
        {
            throw new InvalidOperationException("Un membre doit avoir au moins 12 ans.");
        }

        // Accompagnant obligatoire entre 12 et 18 ans
        if (age < 18 && companionId == null)
        {
            throw new InvalidOperationException("Les membres mineurs (12 à 17 ans) doivent désigner un accompagnant.");
        }

        return new Member
        {
            FirstName = firstName,
            LastName = lastName,
            Gender = gender,
            BirthDate = birthDate,
            HasPaidAnnualDues = false,
            CompanionId = age < 18 ? companionId : null
        };
    }
}