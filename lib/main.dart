// Desenvolvido por: Vivian Gomes Leal da Rocha Santos
// TP4 - Catálogo de Pontos Turísticos: Conheça a Baixada Santista

import 'package:flutter/material.dart';

void main() {
  runApp(const ConhecaBaixadaSantistaApp());
}

class ConhecaBaixadaSantistaApp extends StatelessWidget {
  const ConhecaBaixadaSantistaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conheça a Baixada Santista',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087E8B),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF3F8F8),
      ),
      home: const CatalogoPontosTuristicos(),
    );
  }
}

class PontoTuristico {
  final String nome;
  final String cidade;
  final String descricao;
  final String imagemUrl;
  bool favorito;
  bool visitado;

  PontoTuristico({
    required this.nome,
    required this.cidade,
    required this.descricao,
    required this.imagemUrl,
    this.favorito = false,
    this.visitado = false,
  });
}

class CatalogoPontosTuristicos extends StatefulWidget {
  const CatalogoPontosTuristicos({super.key});

  @override
  State<CatalogoPontosTuristicos> createState() =>
      _CatalogoPontosTuristicosState();
}

class _CatalogoPontosTuristicosState extends State<CatalogoPontosTuristicos> {
  final List<PontoTuristico> pontos = [
    PontoTuristico(
      nome: 'Cachoeira do Paraíso',
      cidade: 'Peruíbe',
      descricao:
          'Um refúgio em meio à Mata Atlântica, conhecido pelas águas naturais e pelo contato com a natureza. Antes de visitar, confira as condições de acesso e as regras locais.',
      imagemUrl:
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/49/4a/20/cachoeira-do-paraiso.jpg?w=1400&h=800&s=1',
    ),
    PontoTuristico(
      nome: 'Cama do Anchieta',
      cidade: 'Itanhaém',
      descricao:
          'Um dos lugares mais visitados por turistas e moradores que não se cansam de admirar as belezas naturais das paisagens que se apresentam durante todo o passeio',
      imagemUrl:
          'https://farm9.staticflickr.com/8240/8660541189_5b6ad5284e_h.jpg',
    ),
    PontoTuristico(
      nome: 'Poço das Antas',
      cidade: 'Mongaguá',
      descricao:
          'Área natural com cachoeira e piscinas naturais cercadas pela vegetação da Mata Atlântica. Ideal para quem gosta de ecoturismo; respeite a sinalização e as orientações de segurança.',
      imagemUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw-kfbjpHuFuPU7rUB6aUSXbr2SMA_PadPedXps6H1Hw&s',
    ),
    PontoTuristico(
      nome: 'Fortaleza de Itaipu',
      cidade: 'Praia Grande',
      descricao:
          'Complexo histórico-militar localizado na região do Canto do Forte, com paisagens do litoral e importância para a história da defesa costeira. O acesso pode depender de autorização ou visita agendada.',
      imagemUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE5erSt3ziUmbyWsJeHoPe33aIGObB7pzNhlgpG0oiuA&s',
    ),
    PontoTuristico(
      nome: 'Teleférico e Morro da Asa Delta',
      cidade: 'São Vicente',
      descricao:
          'Passeio conhecido pelas vistas panorâmicas da praia, da cidade e do mar. O Morro da Asa Delta também é procurado por quem pratica voo livre, conforme condições e regras locais.',
      imagemUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzc_KlicvoJD6WqOweFKT6VRcuBByS5fiT3XSUrYWAyEzaU9SsRrZLkRc&s=10',
    ),
    PontoTuristico(
      nome: 'Jardim da Orla',
      cidade: 'Santos',
      descricao:
          'O jardim da praia de Santos acompanha boa parte da orla com canteiros floridos, árvores e caminhos para caminhar ou pedalar. É famoso por sua extensão e pelo paisagismo à beira-mar.',
      imagemUrl:
          'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9f/Jardim_da_Orla_de_Santos_2.jpg/960px-Jardim_da_Orla_de_Santos_2.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=thumbnail',
    ),
    PontoTuristico(
      nome: 'Mirante das Galhetas',
      cidade: 'Guarujá',
      descricao:
          'Mirante com vistas panorâmicas da costa e acesso a áreas de lazer. Ideal para fotografias e momentos de tranquilidade.',
      imagemUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk8mZpX127p1E77ar5R405uG_KBCXaeYezigvxzGn0hWS34qz1j7xxcc15&s=10',
    ),
    PontoTuristico(
      nome: 'Forte São João',
      cidade: 'Bertioga',
      descricao:
          ' Fortificação histórica à beira do canal de Bertioga, associada ao início da colonização portuguesa na região. O entorno oferece uma vista agradável e um passeio cultural.',
      imagemUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfKqOyHGPQ-dfRorD5u2U-nMowvFa9E5Yq1IERRGK9EPpQRcip5ig32xMK&s=10',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final quantidadeVisitados = pontos.where((ponto) => ponto.visitado).length;
    final quantidadeFavoritos = pontos.where((ponto) => ponto.favorito).length;

    return Scaffold(
      appBar: AppBar(
  toolbarHeight: 76,
  title: const Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        'Conheça a Baixada Santista',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      SizedBox(height: 4),
      Text(
        'Criado por Vivian Gomes Leal',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
    ],
  ),
  centerTitle: true,
  backgroundColor: const Color(0xFF087E8B),
  foregroundColor: Colors.white,
),
      body: Column(
        children: [
          _buildApresentacao(quantidadeVisitados, quantidadeFavoritos),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 20),
              itemCount: pontos.length,
              itemBuilder: (context, index) {
                return _buildCartaoPonto(pontos[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Apresentação e resumo das marcações do catálogo.
  Widget _buildApresentacao(int visitados, int favoritos) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD7E8E8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Explore o litoral!',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'Descubra lugares especiais em sete cidades da Baixada Santista. Marque seus favoritos e registre os locais que já visitou.',
            style: TextStyle(fontSize: 14, height: 1.4),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildContador(Icons.favorite, '$favoritos favoritos'),
              const SizedBox(width: 12),
              _buildContador(Icons.place, '$visitados visitados'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContador(IconData icone, String texto) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icone, size: 18, color: const Color(0xFF087E8B)),
        const SizedBox(width: 5),
        Text(texto, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }

  // Cada cartão reúne imagem, informações e os dois checkboxes pedidos.
  Widget _buildCartaoPonto(PontoTuristico ponto) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            ponto.imagemUrl,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
            // Exibe uma alternativa caso a conexão ou a imagem falhe.
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 180,
                width: double.infinity,
                color: const Color(0xFFDCECEC),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image_not_supported_outlined, size: 42),
                    SizedBox(height: 8),
                    Text('Imagem indisponível'),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ponto.nome,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        size: 17, color: Color(0xFF087E8B)),
                    const SizedBox(width: 4),
                    Text(
                      ponto.cidade,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF087E8B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  ponto.descricao,
                  style: const TextStyle(fontSize: 14, height: 1.4),
                ),
              ],
            ),
          ),
          const Divider(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('Favorito', style: TextStyle(fontSize: 13)),
                    value: ponto.favorito,
                    activeColor: const Color(0xFF087E8B),
                    onChanged: (valor) {
                      setState(() {
                        ponto.favorito = valor ?? false;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('Visitado', style: TextStyle(fontSize: 13)),
                    value: ponto.visitado,
                    activeColor: const Color(0xFF087E8B),
                    onChanged: (valor) {
                      setState(() {
                        ponto.visitado = valor ?? false;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
