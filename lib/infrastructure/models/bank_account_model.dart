

class BankAccountModel {
    final int idAccount;
    final int idUser;
    final int accountNumber;
    final int accountAmount;

    BankAccountModel({
        required this.idAccount,
        required this.idUser,
        required this.accountNumber,
        required this.accountAmount,
    });

    factory BankAccountModel.fromJson(Map<String, dynamic> json) => BankAccountModel(
        idAccount: json["idAccount"],
        idUser: json["idUser"],
        accountNumber: json["accountNumber"],
        accountAmount: json["accountAmount"],
    );

    

    
}
