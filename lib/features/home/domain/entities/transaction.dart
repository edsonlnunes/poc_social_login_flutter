// dados do cliente (customer) (quem tem o cartão -- classe cartao) -- classe diferente (pessoa)
// dados vendedor (seller) (quem recebe o pagamento) -- classe difrente (pessoa)
//
// valor
// desconto
// data transacao
// parcela = 5
// id da parcela
// status
// identificador da transacao
// cancelamento
// data do vencimento
//
// identificador do pedido

import 'package:login_firebase/features/home/domain/value_objects/id.dart';

import 'customer.dart';
import 'seller.dart';

class Transaction {
  ID? _id;
  ID? get id => _id;

  Customer? _customer;
  Customer? get customer => _customer;

  Seller? _seller;
  Seller? get seller => _seller;
}
