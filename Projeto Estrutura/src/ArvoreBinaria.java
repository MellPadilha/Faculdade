import java.util.Queue;
import java.util.LinkedList;

class Node {

  public Integer idade;
  public Node esquerda;
  public Node direita;

  public Node() {
    this.idade = null;
    this.esquerda = null;
    this.direita = null;
  }

  public Node(Integer idade) {
    this.idade = idade;
    this.esquerda = null;
    this.direita = null;
  }

  public Node(Integer idade, Node esquerda, Node direita) {
    this.idade = idade;
    this.esquerda = esquerda;
    this.direita = direita;
  }

  public Integer pegaIdade() {
    return idade;
  }

  public void mudaIdade(Integer idade) {
    this.idade = idade;
  }

  public Node pegaEsquerda() {
    return esquerda;
  }

  public void mudaEsquerda(Node esquerda) {
    this.esquerda = esquerda;
  }

  public Node pegaDireita() {
    return direita;
  }

  public void mudaDireita(Node direita) {
    this.direita = direita;
  }

}

public class ArvoreBinaria {

  private Node arvore;

  public ArvoreBinaria(Integer raiz) {
    this.arvore = new Node(raiz);
  }

  public ArvoreBinaria() {
    this.arvore = null;
  }

  public Node pegaArvore() {
    return arvore;
  }

  public void mudaArvore(Node arvore) {
    this.arvore = arvore;
  }

  public Node insercao(Integer idade) {
    this.arvore = insercao(this.arvore, idade);
    return this.arvore;
  }

  public Node insercao(Node pRaiz, Integer idade) {
    if (pRaiz == null) {
      pRaiz = new Node(idade);
      // System.out.println("Retorne " + idade);
      return pRaiz;

    } else {
      if (pRaiz.pegaIdade() >= idade) {
        // System.out.println("pRaiz.pegaEsquerda() " + idade);
        pRaiz.mudaEsquerda(insercao(pRaiz.pegaEsquerda(), idade));
      } else {
        // System.out.println("insercao(pRaiz.pegaDireita() " + idade);
        pRaiz.mudaDireita(insercao(pRaiz.pegaDireita(), idade));
      }
    }
    return pRaiz;
  }

  public Node MenorEsquerda() {
    return MenorEsquerda(this.arvore);
  }

  public Node MenorEsquerda(Node no) {
    if (no.pegaEsquerda() != null) {
      return MenorEsquerda(no.pegaEsquerda());
    }
    return no;
  }

  public Node MaiorDireita() {
    return MaiorDireita(this.arvore);
  }

  public Node MaiorDireita(Node no) {
    if (no.pegaDireita() != null) {
      return MaiorDireita(no.pegaDireita());
    }
    return no;
  }

  public int encontraMaior() {
    return encontraMaior(this.arvore);
  }

  public int encontraMaior(Node raiz) {
    if (raiz.pegaDireita() != null) {
      return encontraMaior(raiz.pegaDireita());
    } else {
      return raiz.pegaIdade();
    }
  }

  public Node remover(Integer idade) {
    return remover(this.arvore, new Node(idade));
  }

  public Node remover(Node raiz, Node no) {
    // verifica incialmente se nÃ³ raiz Ã© null
    if (raiz == null) {
      return null;
    } else if (no.pegaIdade() < raiz.pegaIdade()) {
      // processar a subÃ¡rvore a esquerda
      raiz.mudaEsquerda(remover(raiz.pegaEsquerda(), no));
    } else if (no.pegaIdade() > raiz.pegaIdade()) {
      // processar a subÃ¡rvore a direita
      raiz.mudaDireita(remover(raiz.pegaDireita(), no));
    } else if (raiz.pegaIdade() == no.pegaIdade()) {
      // Caso 3: o nÃ³ a ser excluÃ­do tem 2 filhos
      if (raiz.pegaEsquerda() != null && raiz.pegaDireita() != null) {
        // Encontrar a maior chave a esquerda do nÃ³ raiz/corrente.
        int esq_max = encontraMaior(raiz.pegaEsquerda());
        // Mudar o valor da chave do nÃ³ raiz com o valor lmax
        raiz.mudaIdade(esq_max);
        // Inicar processo para excluir o nÃ³ com a maior chave esq_max
        raiz.mudaEsquerda(remover(raiz.pegaEsquerda(), new Node(esq_max)));
        return raiz;
      } // Caso 2: o nÃ³ a ser excluÃ­do tem 1 filho
      // Case 2.1: tem apenas um filho a esquerda
      else if (raiz.pegaEsquerda() != null) {
        return raiz.pegaEsquerda();
      } // Case 2.2.: tem apenas um filho a direita
      else if (raiz.pegaDireita() != null) {
        return raiz.pegaDireita();
      } // Case 2.3: nÃ£o nenhum filho
      else {
        return null;
      }
    }
    return raiz;
  }

  public void PreOrdem() {
    PreOrdem(this.arvore);
    System.out.println();
  }

  public void PreOrdem(Node pRaiz) {
    if (pRaiz == null) {
      // System.out.println("null");
      return;
    }
    System.out.print(pRaiz.pegaIdade() + " ");
    // System.out.println("Esquerda");
    PreOrdem(pRaiz.pegaEsquerda());
    // System.out.println("Direita");
    PreOrdem(pRaiz.pegaDireita());
  }

  public void EmOrdem() {
    EmOrdem(this.arvore);
    System.out.println();
  }

  public void EmOrdem(Node pRaiz) {
    if (pRaiz == null) {
      // System.out.println("null");
      return;
    }
    // System.out.println("Esquerda");
    EmOrdem(pRaiz.pegaEsquerda());
    System.out.print(pRaiz.pegaIdade() + " ");
    // System.out.println("Direita");
    EmOrdem(pRaiz.pegaDireita());
  }

  public void PosOrdem() {
    PosOrdem(this.arvore);
    System.out.println();
  }

  public void PosOrdem(Node pRaiz) {
    if (pRaiz == null) {
      // System.out.println("null");
      return;
    }
    // System.out.println("Esquerda");
    PosOrdem(pRaiz.pegaEsquerda());
    // System.out.println("Direita");
    PosOrdem(pRaiz.pegaDireita());
    System.out.print(pRaiz.pegaIdade() + " ");
  }

  public int contarFolhas() {
    return contarFolhas(this.arvore);
  }

  private int contarFolhas(Node pRaiz) {
    if (pRaiz == null) {
      return 0;
    }
    if (pRaiz.pegaEsquerda() == null && pRaiz.pegaDireita() == null) {
      return 1;
    }
    return contarFolhas(pRaiz.pegaEsquerda()) +
        contarFolhas(pRaiz.pegaDireita());
  }

  public int maiorQue(int a, int b) {
    if (a > b) {
      return a;
    } else {
      return b;
    }
  }

  public int altura() {
    return altura(this.arvore);
  }

  public int altura(Node pRaiz) {
    if ((pRaiz == null) || (pRaiz.pegaEsquerda() == null
        && pRaiz.pegaDireita() == null)) {
      return 0;
    } else {
      return 1 + maiorQue(altura(pRaiz.pegaEsquerda()), altura(pRaiz.pegaDireita()));
    }
  }

  public Node busca(int idade) {
    return busca(this.arvore, idade);
  }

  private Node busca(Node pRaiz, int idade) {
    if (pRaiz == null) {
      return null;
    } else if (pRaiz.pegaIdade() == idade) {
      return pRaiz;
    } else if (idade < pRaiz.pegaIdade()) {
      return busca(pRaiz.pegaEsquerda(), idade);
    }
    return busca(pRaiz.pegaDireita(), idade);
  }

  // ATIVIDADE AVALIATIVA 1
  // ALUNA: MÉLLANIE KASSIM PADILHA TAVEIRA


  public int contarElementos() {
    return contarElementos(this.arvore);
  }

  private int contarElementos(Node pRaiz) {

    if (pRaiz == null)
      return 0;

    Queue<Node> fila = new LinkedList<Node>();

    fila.add(pRaiz);

    int contador = 0;
    while (!fila.isEmpty()) {
      Node no = fila.poll();
      if (no.pegaDireita() != null && no.pegaEsquerda() != null ||
          no.pegaDireita() == null && no.pegaEsquerda() == null) {
        contador++;
      }

      if (no.pegaDireita() != null) {
        fila.add(no.pegaDireita());
      }

      if (no.pegaEsquerda() != null) {
        fila.add(no.pegaEsquerda());
      }
    }
    return contador;
  }

  public int somarElementos() {
    return somarElementos(this.arvore);
  }

  private int somarElementos(Node pRaiz) {

    int soma, somaEsquerda, somaDireita;
    soma = somaDireita = somaEsquerda = 0;

    if (pRaiz == null) {
      System.out.println("Arvore vazia");
      return 0;
    } else {
      if (pRaiz.esquerda != null)
        somaEsquerda = somarElementos(pRaiz.esquerda);

      if (pRaiz.direita != null)
        somaDireita = somarElementos(pRaiz.direita);

      soma = pRaiz.idade + somaEsquerda + somaDireita;
      return soma;
    }
  }

  public static void main(String[] args) {

    System.out.println("-------------  Arvore de Binaria de Busca----------");

    ArvoreBinaria arvore = new ArvoreBinaria();

    /// *
    arvore.insercao(8);
    arvore.insercao(5);
    arvore.insercao(9);
    arvore.insercao(3);
    arvore.insercao(7);
    arvore.insercao(2);
    arvore.insercao(4);
    arvore.insercao(6);

    System.out.println("PreOrdem (RED): ");
    arvore.PreOrdem();
    System.out.println("EmOrdem (ERD): ");
    arvore.EmOrdem();
    System.out.println("PosOrdem (EDR): ");
    arvore.PosOrdem();
    System.out.println("-----------------------------------------");

    arvore.remover(8);
    System.out.println("PreOrdem (RED): ");
    arvore.PreOrdem();
    System.out.println("EmOrdem (ERD): ");
    arvore.EmOrdem();
    System.out.println("PosOrdem (EDR): ");
    arvore.PosOrdem();
    System.out.println("-----------------------------------------");

    System.out.println("busca(4): " + arvore.busca(4).pegaIdade());

    System.out.println("altura: " + arvore.altura());
    System.out.println("contarFolhas: " + arvore.contarFolhas());
    System.out.println("encontraMaior: " + arvore.encontraMaior());
    System.out.println("contarNos: " + arvore.contarElementos());
    System.out.println("somarElementos: " + arvore.somarElementos());
    // */
  }

}