import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr', 'es', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
    String? esText = '',
    String? ptText = '',
  }) =>
      [enText, frText, esText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage_old
  {
    'c3bf86is': {
      'en': 'Let’s connect you',
      'es': 'Vamos a conectarte',
      'fr': 'Connectons-vous',
      'pt': 'Vamos conectar você',
    },
    'mrxx8unh': {
      'en': 'Sign into your account',
      'es': 'Inicia sesión en tu cuenta',
      'fr': 'Connectez-vous à votre compte',
      'pt': 'Entre na sua conta',
    },
    'oukb9fcp': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'pt': 'E-mail',
    },
    'aitcfxot': {
      'en': 'enter your email',
      'es': 'Ingrese su correo electrónico',
      'fr': 'entrez votre email',
      'pt': 'digite seu e-mail',
    },
    'g2vcfgg6': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'pt': 'Senha',
    },
    'g56frryk': {
      'en': 'enter your password',
      'es': 'Ingrese su contraseña',
      'fr': 'entrez votre mot de passe',
      'pt': 'digite sua senha',
    },
    'sz8vjnf4': {
      'en': 'Log In',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'pt': 'Conecte-se',
    },
    'jcgox5bv': {
      'en': 'Forgot password',
      'es': 'Has olvidado tu contraseña',
      'fr': 'Mot de passe oublié',
      'pt': 'Esqueceu sua senha',
    },
    '6f4myycx': {
      'en': 'Don\'t have an account?',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
      'pt': 'Não tem uma conta?',
    },
    'f6nywzqi': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
      'pt': 'Inscrever-se',
    },
    'hun4r1di': {
      'en': 'Or',
      'es': 'O',
      'fr': 'Ou',
      'pt': 'Ou',
    },
    'x0ued68k': {
      'en': 'Sign in with Google',
      'es': 'Iniciar sesión con Google',
      'fr': 'Connectez-vous avec Google',
      'pt': 'Entrar com o Google',
    },
    'j5t7xq1s': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'pt': 'Campo obrigatório',
    },
    '5euh1gjk': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'pt': 'Por favor, escolha uma opção no menu suspenso',
    },
    'dbdl65nq': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'pt': 'Campo obrigatório',
    },
    '2edn6xr9': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'pt': 'Por favor, escolha uma opção no menu suspenso',
    },
    '6wlmluk2': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // forgetPassword
  {
    '42sfh00a': {
      'en': 'Back',
      'es': 'Atrás',
      'fr': 'Dos',
      'pt': 'Voltar',
    },
    'n8phhg9z': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
      'fr': 'Mot de passe oublié',
      'pt': 'Esqueceu sua senha',
    },
    'bj1eu88h': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'es':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña, ingrese el correo electrónico asociado con su cuenta a continuación.',
      'fr':
          'Nous vous enverrons un e-mail avec un lien pour réinitialiser votre mot de passe, veuillez saisir l\'e-mail associé à votre compte ci-dessous.',
      'pt':
          'Enviaremos um e-mail com um link para redefinir sua senha. Insira abaixo o e-mail associado à sua conta.',
    },
    'wdj2fjrb': {
      'en': 'Enter your email...',
      'es': 'Introduce tu email...',
      'fr': 'Entrez votre email...',
      'pt': 'Digite seu e-mail...',
    },
    'j475xrvr': {
      'en': 'Send Link',
      'es': 'Enviar enlace',
      'fr': 'Envoyer le lien',
      'pt': 'Enviar link',
    },
    'q1o0aj3v': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // ResourceCenter
  {
    '2nuxauue': {
      'en': 'Resource Center',
      'es': 'Centro de recursos',
      'fr': 'Centre de ressources',
      'pt': 'Centro de Recursos',
    },
    'xk6dqgph': {
      'en': 'We connect expats to resources, these are the services we offer',
      'es':
          'Conectamos a expatriados con recursos, estos son los servicios que ofrecemos',
      'fr':
          'Nous connectons les expatriés aux ressources, voici les services que nous proposons',
      'pt':
          'Conectamos expatriados a recursos, estes são os serviços que oferecemos',
    },
    'iovehwzx': {
      'en': 'Expats Documents',
      'es': 'Documentos para expatriados',
      'fr': 'Documents pour expatriés',
      'pt': 'Documentos de expatriados',
    },
    'cvrf2tqr': {
      'en': 'Expats Biz Startup',
      'es': 'Expats Biz Startup',
      'fr': 'Démarrage d\'entreprise pour expatriés',
      'pt': 'Expats Biz Startup',
    },
    'gsy84zhh': {
      'en': 'Expats Documents',
      'es': 'Documentos para expatriados',
      'fr': 'Documents pour expatriés',
      'pt': 'Documentos de expatriados',
    },
    'w6avuht4': {
      'en': 'Expats Biz Startup',
      'es': 'Expats Biz Startup',
      'fr': 'Démarrage d\'entreprise pour expatriés',
      'pt': 'Expats Biz Startup',
    },
    'hgz0mbq2': {
      'en': 'Or chat with our virtual assistant',
      'es': 'O chatea con nuestro asistente virtual',
      'fr': 'Ou discutez avec notre assistant virtuel',
      'pt': 'Ou converse com nosso assistente virtual',
    },
    'ydaur1y3': {
      'en': 'Afro Tango',
      'es': 'Afrotango',
      'fr': 'Afro Tango',
      'pt': 'Afro Tango',
    },
    'sw6xj0qe': {
      'en':
          'Hey! How are you doing? I saw your post about the expat meetup next week.',
      'es':
          '¡Hola! ¿Cómo estás? Vi tu publicación sobre la reunión de expatriados la semana que viene.',
      'fr':
          'Salut ! Comment vas-tu ? J\'ai vu ton message concernant la rencontre d\'expatriés de la semaine prochaine.',
      'pt':
          'Olá! Como vai? Vi sua postagem sobre o encontro de expatriados na semana que vem.',
    },
    'i6lmfu33': {
      'en': '10:30 AM',
      'es': '10:30 a. m.',
      'fr': '10h30',
      'pt': '10h30',
    },
    'dfsgl2e0': {
      'en': 'Hi Sarah! I\'m good, thanks! Yes, are you planning to attend?',
      'es': '¡Hola Sarah! ¡Bien, gracias! Sí, ¿piensas asistir?',
      'fr': 'Salut Sarah ! Ça va, merci ! Oui, tu comptes venir ?',
      'pt': 'Oi, Sarah! Tudo bem, obrigada! Sim, você pretende comparecer?',
    },
    '0prqz8xb': {
      'en': '10:32 AM',
      'es': '10:32 a. m.',
      'fr': '10h32',
      'pt': '10h32',
    },
    '9f1hgwgq': {
      'en': 'tell us what you want....',
      'es': 'Dinos que quieres....',
      'fr': 'dites-nous ce que vous voulez....',
      'pt': 'diga-nos o que você quer...',
    },
    'ncz374xm': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // CreateBusiness
  {
    '0l09n6vb': {
      'en': 'Drop your business image here or browse',
      'es': 'Deja aquí la imagen de tu negocio o navega',
      'fr': 'Déposez l\'image de votre entreprise ici ou parcourez',
      'pt': 'Solte a imagem da sua empresa aqui ou navegue',
    },
    'wbxt06ir': {
      'en': 'Business Name',
      'es': 'Nombre de la empresa',
      'fr': 'Nom de l\'entreprise',
      'pt': 'Nome da empresa',
    },
    '5lr09250': {
      'en': 'Business Name',
      'es': 'Nombre de la empresa',
      'fr': 'Nom de l\'entreprise',
      'pt': 'Nome da empresa',
    },
    'qtspx1gr': {
      'en': 'Select Category',
      'es': 'Seleccionar categoría',
      'fr': 'Sélectionnez une catégorie',
      'pt': 'Selecione a categoria',
    },
    '84zhovvg': {
      'en': 'Select Category',
      'es': 'Seleccionar categoría',
      'fr': 'Sélectionnez une catégorie',
      'pt': 'Selecione a categoria',
    },
    'ksuoquqj': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
      'pt': 'Procurar...',
    },
    'vsaxcsrs': {
      'en': 'Real Estate',
      'es': 'Bienes raíces',
      'fr': 'Immobilier',
      'pt': 'Imobiliária',
    },
    'oq1r2ilo': {
      'en': 'Automotive',
      'es': 'Automotor',
      'fr': 'Automobile',
      'pt': 'Automotivo',
    },
    '3r6c36dv': {
      'en': 'Business Support',
      'es': 'Apoyo empresarial',
      'fr': 'Soutien aux entreprises',
      'pt': 'Suporte Empresarial',
    },
    'hvjeo4tg': {
      'en': 'Computers and Electronics',
      'es': 'Computadoras y electrónica',
      'fr': 'Informatique et électronique',
      'pt': 'Computadores e Eletrônicos',
    },
    't9z8lgf9': {
      'en': 'Construction and Contractors',
      'es': 'Construcción y contratistas',
      'fr': 'Construction et entrepreneurs',
      'pt': 'Construção e Empreiteiros',
    },
    'nnm4a0xb': {
      'en': 'Education',
      'es': 'Educación',
      'fr': 'Éducation',
      'pt': 'Educação',
    },
    'o7e5iin9': {
      'en': 'Entertainment',
      'es': 'Entretenimiento',
      'fr': 'Divertissement',
      'pt': 'Entretenimento',
    },
    'e93sd8a7': {
      'en': 'Food & Dinning',
      'es': 'Comida y cena',
      'fr': 'Nourriture et restauration',
      'pt': 'Comida e Jantar',
    },
    'pg3t0gu4': {
      'en': 'Health and Medicine',
      'es': 'Salud y Medicina',
      'fr': 'Santé et médecine',
      'pt': 'Saúde e Medicina',
    },
    'r66n2boh': {
      'en': 'Home & Garden',
      'es': 'Hogar y jardín',
      'fr': 'Maison et jardin',
      'pt': 'Casa e Jardim',
    },
    'al6cqqda': {
      'en': 'Legal & Finance',
      'es': 'Legal y Finanzas',
      'fr': 'Juridique et financier',
      'pt': 'Jurídico e Financeiro',
    },
    '9tc40oit': {
      'en': 'Merchant (Retail)',
      'es': 'Comerciante (minorista)',
      'fr': 'Commerçant (détail)',
      'pt': 'Comerciante (Varejo)',
    },
    '76546bul': {
      'en': 'Miscellaneous',
      'es': 'Misceláneas',
      'fr': 'Divers',
      'pt': 'Variado',
    },
    'e18a6xyt': {
      'en': 'Personal Care & Services',
      'es': 'Cuidado personal y servicios',
      'fr': 'Soins et services personnels',
      'pt': 'Cuidados e Serviços Pessoais',
    },
    '9hgln7n4': {
      'en': 'Business Description',
      'es': 'Descripción del negocio',
      'fr': 'Description de l\'entreprise',
      'pt': 'Descrição do negócio',
    },
    '58s7jec8': {
      'en': 'Business description',
      'es': 'Descripción del negocio',
      'fr': 'Description de l\'entreprise',
      'pt': 'Descrição do negócio',
    },
    'pbbt5nqu': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'pt': 'E-mail',
    },
    'k8v29l98': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse email',
      'pt': 'Endereço de email',
    },
    'esv2in9l': {
      'en': 'Address',
      'es': 'DIRECCIÓN',
      'fr': 'Adresse',
      'pt': 'Endereço',
    },
    'petvt9kp': {
      'en': 'Business Address',
      'es': 'Dirección comercial',
      'fr': 'Adresse de l\'entreprise',
      'pt': 'Endereço comercial',
    },
    '9s45b3ey': {
      'en': 'Country',
      'es': 'País',
      'fr': 'Pays',
      'pt': 'País',
    },
    'h9l3a21u': {
      'en': 'Business Country',
      'es': 'País de negocios',
      'fr': 'Pays d\'affaires',
      'pt': 'País de negócios',
    },
    'mhhyr8j3': {
      'en': 'Google map link to your business',
      'es': 'Enlace del mapa de Google a su negocio',
      'fr': 'Lien Google Map vers votre entreprise',
      'pt': 'Link do Google Maps para sua empresa',
    },
    'wz5ib0dr': {
      'en': 'Google map link',
      'es': 'Enlace al mapa de Google',
      'fr': 'Lien vers la carte Google',
      'pt': 'Link do mapa do Google',
    },
    '68txf9z6': {
      'en': 'Buisness Website',
      'es': 'Sitio web empresarial',
      'fr': 'Site Web d\'entreprise',
      'pt': 'Site de negócios',
    },
    'dohywws2': {
      'en': 'Website URL',
      'es': 'URL del sitio web',
      'fr': 'URL du site Web',
      'pt': 'URL do site',
    },
    'kyif6im1': {
      'en': 'Whatsapp Number',
      'es': 'Número de WhatsApp',
      'fr': 'Numéro Whatsapp',
      'pt': 'Número do Whatsapp',
    },
    'dnsgsxhs': {
      'en': 'Whatsapp Number',
      'es': 'Número de WhatsApp',
      'fr': 'Numéro Whatsapp',
      'pt': 'Número do Whatsapp',
    },
    'r3xcs8yp': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
      'pt': 'Número de telefone',
    },
    '1zzxm80k': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
      'pt': 'Número de telefone',
    },
    '2i378v55': {
      'en': 'Create',
      'es': 'Crear',
      'fr': 'Créer',
      'pt': 'Criar',
    },
    'mlzzdsy6': {
      'en': 'List a Business',
      'es': 'Listar un negocio',
      'fr': 'Lister une entreprise',
      'pt': 'Listar uma empresa',
    },
    'lr9xsptk': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // EditProfile
  {
    '8pyybi39': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Modifier le profil',
      'pt': 'Editar perfil',
    },
    'ih3554ka': {
      'en': 'Save',
      'es': 'Ahorrar',
      'fr': 'Sauvegarder',
      'pt': 'Salvar',
    },
    'ht4mkvpm': {
      'en': 'Personal Details',
      'es': 'Datos personales',
      'fr': 'Détails personnels',
      'pt': 'Dados pessoais',
    },
    '2bh5huef': {
      'en': 'First Name',
      'es': 'Nombre de pila',
      'fr': 'Prénom',
      'pt': 'Primeiro nome',
    },
    '9l41zs36': {
      'en': 'First name',
      'es': 'Nombre de pila',
      'fr': 'Prénom',
      'pt': 'Primeiro nome',
    },
    'ae321w1l': {
      'en': 'Other Names',
      'es': 'Otros nombres',
      'fr': 'Autres noms',
      'pt': 'Outros nomes',
    },
    'p0te4tl8': {
      'en': 'Other Names',
      'es': 'Otros nombres',
      'fr': 'Autres noms',
      'pt': 'Outros nomes',
    },
    'kq709p8a': {
      'en': 'Last Name',
      'es': 'Apellido',
      'fr': 'Nom de famille',
      'pt': 'Sobrenome',
    },
    '9q1u5fma': {
      'en': 'Last Name',
      'es': 'Apellido',
      'fr': 'Nom de famille',
      'pt': 'Sobrenome',
    },
    'guvmv2qj': {
      'en': 'Date of Birth',
      'es': 'Fecha de nacimiento',
      'fr': 'Date de naissance',
      'pt': 'Data de nascimento',
    },
    'b8yar1lb': {
      'en': 'Gender',
      'es': 'Género',
      'fr': 'Genre',
      'pt': 'Gênero',
    },
    'atdsocde': {
      'en': 'Select gender',
      'es': 'Seleccione género',
      'fr': 'Sélectionnez le sexe',
      'pt': 'Selecione o gênero',
    },
    'l3pa92v0': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
      'pt': 'Procurar...',
    },
    '2c8oityi': {
      'en': 'Male',
      'es': 'Masculino',
      'fr': 'Mâle',
      'pt': 'Macho',
    },
    '3z8z589c': {
      'en': 'Female',
      'es': 'Femenino',
      'fr': 'Femelle',
      'pt': 'Fêmea',
    },
    'm8pasahm': {
      'en': 'Select a Career',
      'es': 'Seleccione una carrera',
      'fr': 'Sélectionnez une carrière',
      'pt': 'Selecione uma carreira',
    },
    'x4bvlngf': {
      'en': 'Select Career',
      'es': 'Seleccionar Carrera',
      'fr': 'Sélectionnez une carrière',
      'pt': 'Selecione Carreira',
    },
    '0lx1sgta': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
      'pt': 'Procurar...',
    },
    'oht60kp2': {
      'en': 'Student',
      'es': 'Alumno',
      'fr': 'Étudiant',
      'pt': 'Estudante',
    },
    '9vz9lq42': {
      'en': 'Athlete',
      'es': 'Atleta',
      'fr': 'Athlète',
      'pt': 'Atleta',
    },
    'fklypb8o': {
      'en': 'Professional',
      'es': 'Profesional',
      'fr': 'Professionnel',
      'pt': 'Profissional',
    },
    'h3d812rz': {
      'en': 'Entrepreneur',
      'es': 'Emprendedor',
      'fr': 'Entrepreneur',
      'pt': 'Empreendedor',
    },
    '3ugwtky7': {
      'en': 'Artisan',
      'es': 'Artesano',
      'fr': 'Artisan',
      'pt': 'Artesão',
    },
    'pdv1vh88': {
      'en': 'Profession',
      'es': 'Profesión',
      'fr': 'Profession',
      'pt': 'Profissão',
    },
    'lp43u3xv': {
      'en': 'Select your profession',
      'es': 'Selecciona tu profesión',
      'fr': 'Sélectionnez votre profession',
      'pt': 'Selecione sua profissão',
    },
    'hqtau2x5': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
      'pt': 'Procurar...',
    },
    'gs8sqnfv': {
      'en': 'Country of Residence',
      'es': 'País de residencia',
      'fr': 'Pays de résidence',
      'pt': 'País de Residência',
    },
    'pnvgme2p': {
      'en': 'Select country',
      'es': 'Seleccionar país',
      'fr': 'Sélectionnez un pays',
      'pt': 'Selecione o país',
    },
    'e2hmtvly': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
      'pt': 'Procurar...',
    },
    'nzaddat6': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'fr': 'Option 1',
      'pt': 'Opção 1',
    },
    'abz4fm9i': {
      'en': 'Option 2',
      'es': 'Opción 2',
      'fr': 'Option 2',
      'pt': 'Opção 2',
    },
    'upog43tf': {
      'en': 'Option 3',
      'es': 'Opción 3',
      'fr': 'Option 3',
      'pt': 'Opção 3',
    },
    'ev7r5y7a': {
      'en': 'Profile Details',
      'es': 'Detalles del perfil',
      'fr': 'Détails du profil',
      'pt': 'Detalhes do perfil',
    },
    '36s6ee5k': {
      'en': 'Bio',
      'es': 'Biografía',
      'fr': 'Biographie',
      'pt': 'Biografia',
    },
    '7vjec7mv': {
      'en': 'Write your description here',
      'es': 'Escribe tu descripción aquí',
      'fr': 'Écrivez votre description ici',
      'pt': 'Escreva sua descrição aqui',
    },
    '00fdixoy': {
      'en': 'Contact Details',
      'es': 'Datos de contacto',
      'fr': 'Coordonnées',
      'pt': 'Detalhes do contato',
    },
    'juw6xqqx': {
      'en': 'Phone',
      'es': 'Teléfono',
      'fr': 'Téléphone',
      'pt': 'Telefone',
    },
    '9cqm8o5e': {
      'en': 'Phone',
      'es': 'Teléfono',
      'fr': 'Téléphone',
      'pt': 'Telefone',
    },
    'glcdbbqo': {
      'en': 'Facebook',
      'es': 'Facebook',
      'fr': 'Facebook',
      'pt': 'Facebook',
    },
    'i45cdz4a': {
      'en': 'Facebook',
      'es': 'Facebook',
      'fr': 'Facebook',
      'pt': 'Facebook',
    },
    'dkdxo85n': {
      'en': 'twitter',
      'es': 'gorjeo',
      'fr': 'gazouillement',
      'pt': 'Twitter',
    },
    '043siokp': {
      'en': 'Twitter',
      'es': 'Gorjeo',
      'fr': 'Gazouillement',
      'pt': 'Twitter',
    },
    '9c0xsonn': {
      'en': 'instagram',
      'es': 'Instagram',
      'fr': 'Instagram',
      'pt': 'Instagram',
    },
    '40cff0vs': {
      'en': 'Instagram',
      'es': 'Instagram',
      'fr': 'Instagram',
      'pt': 'Instagram',
    },
    'kvsnqjoh': {
      'en': 'first_name is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    's5mny5o6': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'rsf2jzls': {
      'en': 'other_name is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'rsmrpusq': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'nfph41f3': {
      'en': 'last_name is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'vtwxrk2c': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '6qlwgpbi': {
      'en': 'bio is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '67svsxp8': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'zhtdzabm': {
      'en': 'Phone is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'wlymf1vr': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'b0llqsoy': {
      'en': 'facebook is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'tn4a3mc1': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '9ip1v598': {
      'en': 'twitter is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '752d4mlr': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '9g2y966q': {
      'en': 'instagram is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'lglptuf2': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'sl4atgla': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // Profiles
  {
    'b6heyki4': {
      'en': 'Profile',
      'es': 'Perfil',
      'fr': 'Profil',
      'pt': 'Perfil',
    },
    'g6ru6zrr': {
      'en': 'Get Verified',
      'es': 'Obtener verificación',
      'fr': 'Soyez vérifié',
      'pt': 'Seja verificado',
    },
    'p0hggv41': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '6zsifhn9': {
      'en': 'Edit profile',
      'es': 'Editar perfil',
      'fr': 'Modifier le profil',
      'pt': 'Editar perfil',
    },
    '4ydp873t': {
      'en': 'Bio',
      'es': 'Biografía',
      'fr': 'Biographie',
      'pt': 'Biografia',
    },
    'vzoifrll': {
      'en': 'Posts',
      'es': 'Publicaciones',
      'fr': 'Articles',
      'pt': 'Postagens',
    },
    'jz9rlypf': {
      'en': 'Media',
      'es': 'Medios de comunicación',
      'fr': 'Médias',
      'pt': 'Mídia',
    },
    '7u4bj0dy': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // profileshare
  {
    'q7x8quwg': {
      'en': 'Profile QR Code',
      'es': 'Código QR del perfil',
      'fr': 'Code QR du profil',
      'pt': 'Código QR do perfil',
    },
    'l706ogo8': {
      'en': 'Share your profile',
      'es': 'Comparte tu perfil',
      'fr': 'Partagez votre profil',
      'pt': 'Compartilhe seu perfil',
    },
    'hl08lv6o': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // Eventhome
  {
    'tx6bj7lk': {
      'en': 'Events',
      'es': 'Eventos',
      'fr': 'Événements',
      'pt': 'Eventos',
    },
    'quek167f': {
      'en': 'Search Event',
      'es': 'Buscar evento',
      'fr': 'Rechercher un événement',
      'pt': 'Pesquisar Evento',
    },
    'mh2pb5t9': {
      'en': 'Create Event',
      'es': 'Crear evento',
      'fr': 'Créer un événement',
      'pt': 'Criar evento',
    },
    'kkyj130a': {
      'en': 'My Event',
      'es': 'Mi evento',
      'fr': 'Mon événement',
      'pt': 'Meu Evento',
    },
    'g8r6cnxa': {
      'en': 'Booked Event',
      'es': 'Evento reservado',
      'fr': 'Événement réservé',
      'pt': 'Evento Reservado',
    },
    'nerpqph6': {
      'en': 'Sport',
      'es': 'Deporte',
      'fr': 'Sport',
      'pt': 'Esporte',
    },
    'vpbnljuo': {
      'en': 'Food',
      'es': 'Alimento',
      'fr': 'Nourriture',
      'pt': 'Comida',
    },
    '5u7q30uc': {
      'en': 'All Events',
      'es': 'Todos los eventos',
      'fr': 'Tous les événements',
      'pt': 'Todos os eventos',
    },
    '1kucehsu': {
      'en': 'See More',
      'es': 'Ver más',
      'fr': 'Voir plus',
      'pt': 'Ver mais',
    },
    'kncm04pt': {
      'en': 'Popular Events',
      'es': 'Eventos populares',
      'fr': 'Événements populaires',
      'pt': 'Eventos populares',
    },
    'f9ss6ez6': {
      'en': 'See More',
      'es': 'Ver más',
      'fr': 'Voir plus',
      'pt': 'Ver mais',
    },
    'mleyoskm': {
      'en': 'Special Deal',
      'es': 'Oferta especial',
      'fr': 'Offre spéciale',
      'pt': 'Oferta especial',
    },
    'ehmxsmyp': {
      'en': 'See More',
      'es': 'Ver más',
      'fr': 'Voir plus',
      'pt': 'Ver mais',
    },
    'm7craxi1': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // eventsearch
  {
    'jyyasfw9': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // Eventdetails
  {
    '6i3hha5c': {
      'en': '-',
      'es': '-',
      'fr': '-',
      'pt': '-',
    },
    'j4lukbaw': {
      'en': '- ',
      'es': '-',
      'fr': '-',
      'pt': '-',
    },
    'dl8i00lf': {
      'en': ',',
      'es': ',',
      'fr': ',',
      'pt': ',',
    },
    'vvy7omz8': {
      'en': 'Description',
      'es': 'Descripción',
      'fr': 'Description',
      'pt': 'Descrição',
    },
    '6lvbg4mw': {
      'en': 'Attendance',
      'es': 'Asistencia',
      'fr': 'Présence',
      'pt': 'Presença',
    },
    '25pfrw5l': {
      'en': 'View',
      'es': 'Vista',
      'fr': 'Voir',
      'pt': 'Visualizar',
    },
    'z2vmhdtz': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // eventodersucess
  {
    'tjlqzwfk': {
      'en': 'Registration Successful',
      'es': 'Registro exitoso',
      'fr': 'Inscription réussie',
      'pt': 'Registro bem-sucedido',
    },
    'jnc1jqqv': {
      'en': 'Please check your ticket.',
      'es': 'Por favor revise su billete.',
      'fr': 'Veuillez vérifier votre billet.',
      'pt': 'Por favor, verifique seu ingresso.',
    },
    'hqo5qsuv': {
      'en': 'View Ticket',
      'es': 'Ver boleto',
      'fr': 'Voir le billet',
      'pt': 'Ver bilhete',
    },
    'x4jyy0dw': {
      'en': 'Back to Home',
      'es': 'Volver a la página de inicio',
      'fr': 'Retour à l\'accueil',
      'pt': 'Voltar para casa',
    },
    '9hf8bgqy': {
      'en': 'More Event',
      'es': 'Más eventos',
      'fr': 'Plus d\'événements',
      'pt': 'Mais Eventos',
    },
    'd7jsgd5o': {
      'en': 'See More',
      'es': 'Ver más',
      'fr': 'Voir plus',
      'pt': 'Ver mais',
    },
    'j89b24uj': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // eventTicketDetails
  {
    '6q43aic7': {
      'en': 'Name',
      'es': 'Nombre',
      'fr': 'Nom',
      'pt': 'Nome',
    },
    'de3m583b': {
      'en': 'Gate',
      'es': 'Puerta',
      'fr': 'Grille',
      'pt': 'Portão',
    },
    'nz6lg2bk': {
      'en': 'Time',
      'es': 'Tiempo',
      'fr': 'Temps',
      'pt': 'Tempo',
    },
    'd9wo6901': {
      'en': '-',
      'es': '-',
      'fr': '-',
      'pt': '-',
    },
    '2d27sprf': {
      'en': 'Date',
      'es': 'Fecha',
      'fr': 'Date',
      'pt': 'Data',
    },
    'emuielv3': {
      'en': '-',
      'es': '-',
      'fr': '-',
      'pt': '-',
    },
    'uir7sban': {
      'en': 'Place',
      'es': 'Lugar',
      'fr': 'Lieu',
      'pt': 'Lugar',
    },
    'e26yu58i': {
      'en': ',',
      'es': ',',
      'fr': ',',
      'pt': ',',
    },
    'n43sk22y': {
      'en': 'Scan this QR code',
      'es': 'Escanee este código QR',
      'fr': 'Scannez ce code QR',
      'pt': 'Escaneie este código QR',
    },
    'qusf5bhy': {
      'en': 'or show this ticket',
      'es': 'o muestra este billete',
      'fr': 'ou montrez ce ticket',
      'pt': 'ou mostre este bilhete',
    },
    'zdxjyki5': {
      'en': 'at the concert',
      'es': 'en el concierto',
      'fr': 'au concert',
      'pt': 'no concerto',
    },
    'd0wvje3k': {
      'en': 'Ticket ID',
      'es': 'Identificación del ticket',
      'fr': 'ID du billet',
      'pt': 'ID do bilhete',
    },
    'k09amqlb': {
      'en': 'Download Ticket',
      'es': 'Descargar Ticket',
      'fr': 'Télécharger le billet',
      'pt': 'Baixar ingresso',
    },
    'd1q3w3jp': {
      'en': 'My Ticket',
      'es': 'Mi boleto',
      'fr': 'Mon billet',
      'pt': 'Meu ingresso',
    },
    'neh25axa': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // eventoder
  {
    'k1s6omym': {
      'en': 'Upcoming',
      'es': 'Próximamente',
      'fr': 'Prochain',
      'pt': 'Por vir',
    },
    'x0gal31a': {
      'en': 'History',
      'es': 'Historia',
      'fr': 'Histoire',
      'pt': 'História',
    },
    'dqeosn9i': {
      'en': 'Booked Events',
      'es': 'Eventos reservados',
      'fr': 'Événements réservés',
      'pt': 'Eventos Reservados',
    },
    'h5fve0pa': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // emptyeventoder
  {
    'ri7r19kw': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // comunityHome
  {
    'pvocze1w': {
      'en': 'Featured Communities',
      'es': 'Comunidades destacadas',
      'fr': 'Communautés en vedette',
      'pt': 'Comunidades em Destaque',
    },
    'wc291bti': {
      'en': 'Popular Communities',
      'es': 'Comunidades populares',
      'fr': 'Communautés populaires',
      'pt': 'Comunidades Populares',
    },
    '45mhu6l6': {
      'en': 'New Communities',
      'es': 'Nuevas comunidades',
      'fr': 'Nouvelles communautés',
      'pt': 'Novas Comunidades',
    },
    'mlifay4m': {
      'en': 'New Chat',
      'es': 'Nuevo chat',
      'fr': 'Nouveau chat',
      'pt': 'Novo bate-papo',
    },
    '7vm00km1': {
      'en': 'Create Group',
      'es': 'Crear grupo',
      'fr': 'Créer un groupe',
      'pt': 'Criar grupo',
    },
    '93po1ety': {
      'en': 'Search Group',
      'es': 'Grupo de búsqueda',
      'fr': 'Groupe de recherche',
      'pt': 'Grupo de Pesquisa',
    },
    'dm0mxel9': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // CommunityProfile
  {
    's2awjfjm': {
      'en': 'Description',
      'es': 'Descripción',
      'fr': 'Description',
      'pt': 'Descrição',
    },
    'r1efunhk': {
      'en': 'Join',
      'es': 'Unirse',
      'fr': 'Rejoindre',
      'pt': 'Juntar',
    },
    '1ah2bcnm': {
      'en': 'Saved Messages',
      'es': 'Mensajes guardados',
      'fr': 'Messages enregistrés',
      'pt': 'Mensagens salvas',
    },
    'xxcyownw': {
      'en': 'Notification',
      'es': 'Notificación',
      'fr': 'Notification',
      'pt': 'Notificação',
    },
    '5mes28fe': {
      'en': 'Files',
      'es': 'Archivos',
      'fr': 'Fichiers',
      'pt': 'Arquivos',
    },
    'at1u8mpb': {
      'en': 'Members',
      'es': 'Miembros',
      'fr': 'Membres',
      'pt': 'Membros',
    },
    '8d08c3yp': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // comunityList
  {
    'hspsju4y': {
      'en': 'search',
      'es': 'buscar',
      'fr': 'recherche',
      'pt': 'procurar',
    },
    'yzrf4tlo': {
      'en': 'Community List',
      'es': 'Lista de la comunidad',
      'fr': 'Liste de la communauté',
      'pt': 'Lista da Comunidade',
    },
    'ug3fb5g9': {
      'en': 'search',
      'es': 'buscar',
      'fr': 'recherche',
      'pt': 'procurar',
    },
    'bpg4gdmu': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // Addmember
  {
    'qvujkg28': {
      'en': 'Create a new Group',
      'es': 'Crear un nuevo grupo',
      'fr': 'Créer un nouveau groupe',
      'pt': 'Criar um novo grupo',
    },
    'agmavocx': {
      'en': 'Select members to add to community',
      'es': 'Seleccione miembros para agregarlos a la comunidad',
      'fr': 'Sélectionnez les membres à ajouter à la communauté',
      'pt': 'Selecione membros para adicionar à comunidade',
    },
    'f11tusqt': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // AddcomunityDetails
  {
    'moyalu5v': {
      'en': 'Title',
      'es': 'Título',
      'fr': 'Titre',
      'pt': 'Título',
    },
    'kwp30hks': {
      'en': 'Description',
      'es': 'Descripción',
      'fr': 'Description',
      'pt': 'Descrição',
    },
    '2xr3j454': {
      'en': 'Categories',
      'es': 'Categorías',
      'fr': 'Catégories',
      'pt': 'Categorias',
    },
    'v5ge84mr': {
      'en': 'displayName is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '8bipiw1z': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '0xz0hxv4': {
      'en': 'description is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'uvc4t86r': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
    's2ih1v77': {
      'en': 'Add group details below',
      'es': 'Agregue detalles del grupo a continuación',
      'fr': 'Ajoutez les détails du groupe ci-dessous',
      'pt': 'Adicione os detalhes do grupo abaixo',
    },
    '01kun1qt': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // searchcontact
  {
    '55cvs65i': {
      'en': 'Search something',
      'es': 'Buscar algo',
      'fr': 'Rechercher quelque chose',
      'pt': 'Pesquisar algo',
    },
    'esn62cxg': {
      'en': 'Professionals',
      'es': 'Profesionales',
      'fr': 'Professionnels',
      'pt': 'Profissionais',
    },
    'mvoonssw': {
      'en': 'Entrepreneurs',
      'es': 'Emprendedores',
      'fr': 'Entrepreneurs',
      'pt': 'Empreendedores',
    },
    'h9vdfrab': {
      'en': 'Students',
      'es': 'Estudiantes',
      'fr': 'Étudiants',
      'pt': 'Estudantes',
    },
    'td5pn1bo': {
      'en': 'Athletes',
      'es': 'Atletas',
      'fr': 'Athlètes',
      'pt': 'Atletas',
    },
    'hm8oc7n6': {
      'en': 'Artisans',
      'es': 'artesanos',
      'fr': 'Artisans',
      'pt': 'Artesãos',
    },
    'qjtw23fm': {
      'en': 'Recent Search',
      'es': 'Búsqueda reciente',
      'fr': 'Recherche récente',
      'pt': 'Pesquisa recente',
    },
    'dmbkqg3y': {
      'en': 'System check',
      'es': 'Comprobación del sistema',
      'fr': 'Vérification du système',
      'pt': 'Verificação do sistema',
    },
    'wf024lpq': {
      'en': 'System check',
      'es': 'Comprobación del sistema',
      'fr': 'Vérification du système',
      'pt': 'Verificação do sistema',
    },
    '3a4159jt': {
      'en': 'System check',
      'es': 'Comprobación del sistema',
      'fr': 'Vérification du système',
      'pt': 'Verificação do sistema',
    },
    'p0cgsqcf': {
      'en': 'Search result',
      'es': 'Resultado de la búsqueda',
      'fr': 'Résultat de la recherche',
      'pt': 'Resultado da pesquisa',
    },
    '7lsn2szn': {
      'en': 'Featured users',
      'es': 'Usuarios destacados',
      'fr': 'Utilisateurs en vedette',
      'pt': 'Usuários em destaque',
    },
    'dmxh8xj7': {
      'en': 'Popular Users',
      'es': 'Usuarios populares',
      'fr': 'Utilisateurs populaires',
      'pt': 'Usuários populares',
    },
    'fe3qxe7d': {
      'en': 'New Users',
      'es': 'Nuevos usuarios',
      'fr': 'Nouveaux utilisateurs',
      'pt': 'Novos usuários',
    },
    '1yoggde8': {
      'en': 'Search people',
      'es': 'Buscar personas',
      'fr': 'Rechercher des personnes',
      'pt': 'Pesquisar pessoas',
    },
    '76ggq9vd': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // Community-ShareQR
  {
    'adiy3l8z': {
      'en': 'Your QR Code',
      'es': 'Tu código QR',
      'fr': 'Votre code QR',
      'pt': 'Seu código QR',
    },
    'r4eeuzv6': {
      'en': 'Share this code to share your profile',
      'es': 'Comparte este código para compartir tu perfil',
      'fr': 'Partagez ce code pour partager votre profil',
      'pt': 'Compartilhe este código para compartilhar seu perfil',
    },
    '07w2t7cg': {
      'en': 'Profile',
      'es': 'Perfil',
      'fr': 'Profil',
      'pt': 'Perfil',
    },
    '8xmmgn8g': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // marketHome
  {
    'ldr7zme7': {
      'en': 'Marketplace',
      'es': 'Mercado',
      'fr': 'Marché',
      'pt': 'Mercado',
    },
    'e7xdzfwt': {
      'en': 'Search product(s)',
      'es': 'Buscar producto(s)',
      'fr': 'Rechercher un ou plusieurs produits',
      'pt': 'Pesquisar produto(s)',
    },
    'g9xjw4dv': {
      'en': 'All',
      'es': 'Todo',
      'fr': 'Tous',
      'pt': 'Todos',
    },
    'qwl41ir4': {
      'en': 'Newest products',
      'es': 'Productos más nuevos',
      'fr': 'Nouveaux produits',
      'pt': 'Produtos mais recentes',
    },
    'vd56p44k': {
      'en': 'view all',
      'es': 'ver todo',
      'fr': 'voir tout',
      'pt': 'ver tudo',
    },
    '9o1c40r6': {
      'en': 'Featured products',
      'es': 'Productos destacados',
      'fr': 'Produits phares',
      'pt': 'Produtos em destaque',
    },
    '8hdemhyf': {
      'en': 'view all',
      'es': 'ver todo',
      'fr': 'voir tout',
      'pt': 'ver tudo',
    },
    '9iz85fdj': {
      'en': 'Marketplace',
      'es': 'Mercado',
      'fr': 'Marché',
      'pt': 'Mercado',
    },
    '9jy9kndz': {
      'en': 'Sell a product',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '3j2kv6b4': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // selected
  {
    'l33mlv1t': {
      'en': 'Selected _ Items',
      'es': 'Artículos seleccionados',
      'fr': 'Articles sélectionnés',
      'pt': 'Itens selecionados',
    },
    '70as0ooa': {
      'en': 'You may also like',
      'es': 'También te puede interesar',
      'fr': 'Vous aimerez peut-être aussi',
      'pt': 'Você também pode gostar',
    },
    'fgnzl89r': {
      'en': 'view all',
      'es': 'ver todo',
      'fr': 'voir tout',
      'pt': 'ver tudo',
    },
    '4sqosltk': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // marketSeach
  {
    'k930sl8l': {
      'en': 'Marketplace',
      'es': 'Mercado',
      'fr': 'Marché',
      'pt': 'Mercado',
    },
    'e93q6vkq': {
      'en': 'Search',
      'es': 'Buscar',
      'fr': 'Recherche',
      'pt': 'Procurar',
    },
    'kf94zmcy': {
      'en': 'Man',
      'es': 'Hombre',
      'fr': 'Homme',
      'pt': 'Homem',
    },
    'uwx58w0v': {
      'en': 'Women',
      'es': 'Mujer',
      'fr': 'Femmes',
      'pt': 'Mulheres',
    },
    'dcrpwhuc': {
      'en': 'Kids',
      'es': 'Niños',
      'fr': 'Enfants',
      'pt': 'Crianças',
    },
    'vnat5xpk': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // market_sort_filter
  {
    'iwfxv9hb': {
      'en': 'Sort and Filter',
      'es': 'Ordenar y filtrar',
      'fr': 'Trier et filtrer',
      'pt': 'Classificar e filtrar',
    },
    '5b2lrud1': {
      'en': 'Sort',
      'es': 'Clasificar',
      'fr': 'Trier',
      'pt': 'Organizar',
    },
    'v4bo3isg': {
      'en': 'Price ( Low to High)',
      'es': 'Precio (de menor a mayor)',
      'fr': 'Prix (du plus bas au plus élevé)',
      'pt': 'Preço (do menor para o maior)',
    },
    'dop8vhex': {
      'en': 'Price ( High to Low)',
      'es': 'Precio (de mayor a menor)',
      'fr': 'Prix (du plus élevé au plus bas)',
      'pt': 'Preço (do maior para o menor)',
    },
    '2uc0ux7y': {
      'en': 'New Arrival',
      'es': 'Recién llegado',
      'fr': 'Nouvelle arrivée',
      'pt': 'Nova chegada',
    },
    '0or0dz08': {
      'en': 'Top Rated',
      'es': 'Los mejor valorados',
      'fr': 'Les mieux notés',
      'pt': 'Mais bem avaliados',
    },
    'skahd6th': {
      'en': 'A-Z',
      'es': 'ARIZONA',
      'fr': 'A-Z',
      'pt': 'A-Z',
    },
    'ook8sz6x': {
      'en': 'Z-A',
      'es': 'Z-A',
      'fr': 'Z-A',
      'pt': 'Z-A',
    },
    '35dskf3t': {
      'en': 'Filter',
      'es': 'Filtrar',
      'fr': 'Filtre',
      'pt': 'Filtro',
    },
    'qxslozj1': {
      'en': 'Color',
      'es': 'Color',
      'fr': 'Couleur',
      'pt': 'Cor',
    },
    'kfrnc11q': {
      'en': 'white',
      'es': 'blanco',
      'fr': 'blanc',
      'pt': 'branco',
    },
    'is9e7z1a': {
      'en': 'blue',
      'es': 'azul',
      'fr': 'bleu',
      'pt': 'azul',
    },
    'oeh19tnp': {
      'en': 'Red',
      'es': 'Rojo',
      'fr': 'Rouge',
      'pt': 'Vermelho',
    },
    'ycb26alb': {
      'en': 'yellow',
      'es': 'amarillo',
      'fr': 'jaune',
      'pt': 'amarelo',
    },
    '7u0dulmy': {
      'en': 'green',
      'es': 'verde',
      'fr': 'vert',
      'pt': 'verde',
    },
    'dkq3s6s5': {
      'en': 'black',
      'es': 'negro',
      'fr': 'noir',
      'pt': 'preto',
    },
    '122h1awh': {
      'en': 'Size',
      'es': 'Tamaño',
      'fr': 'Taille',
      'pt': 'Tamanho',
    },
    '1z4soxky': {
      'en': 'XXS',
      'es': 'XXS',
      'fr': 'XXS',
      'pt': 'XXS',
    },
    'c9pm4oj8': {
      'en': 'XS',
      'es': 'XS',
      'fr': 'XS',
      'pt': 'XS',
    },
    'lq79s0a4': {
      'en': 'S',
      'es': 'S',
      'fr': 'S',
      'pt': 'S',
    },
    '887d46vp': {
      'en': 'M',
      'es': 'METRO',
      'fr': 'M',
      'pt': 'M',
    },
    'y83fchcp': {
      'en': 'L',
      'es': 'Yo',
      'fr': 'L',
      'pt': 'eu',
    },
    'sqtio4ru': {
      'en': 'XL',
      'es': 'SG',
      'fr': 'XL',
      'pt': 'GG',
    },
    '9go49wi5': {
      'en': 'XXL',
      'es': 'XXL',
      'fr': 'XXL',
      'pt': 'XXG',
    },
    'ptk1ftjt': {
      'en': 'Price',
      'es': 'Precio',
      'fr': 'Prix',
      'pt': 'Preço',
    },
    'bqsogpr8': {
      'en': '10-200',
      'es': '10-200',
      'fr': '10-200',
      'pt': '10-200',
    },
    'gwofvdna': {
      'en': '200-500',
      'es': '200-500',
      'fr': '200-500',
      'pt': '200-500',
    },
    'l2js2e2k': {
      'en': '500-1000',
      'es': '500-1000',
      'fr': '500-1000',
      'pt': '500-1000',
    },
    'qo58loiu': {
      'en': '1000-2000',
      'es': '1000-2000',
      'fr': '1000-2000',
      'pt': '1000-2000',
    },
    'jyeni577': {
      'en': '2000-5000',
      'es': '31/01/2004 00:00:00Z',
      'fr': '31/01/2004 à 00:00:00',
      'pt': '2004-01-31T00:00:00Z',
    },
    'rkqfaian': {
      'en': '5000-10000',
      'es': '5000-10000',
      'fr': '5000-10000',
      'pt': '5000-10000',
    },
    'f5h2le2v': {
      'en': '10000-100000',
      'es': '10000-100000',
      'fr': '10000-100000',
      'pt': '10000-100000',
    },
    'bk4ofe2p': {
      'en': 'Apply',
      'es': 'Aplicar',
      'fr': 'Appliquer',
      'pt': 'Aplicar',
    },
    'pdnflapd': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // product
  {
    'z1wn4ny9': {
      'en': 'Description',
      'es': 'Descripción',
      'fr': 'Description',
      'pt': 'Descrição',
    },
    'yawri0dw': {
      'en': 'Contact Seller',
      'es': 'Contactar al vendedor',
      'fr': 'Contacter le vendeur',
      'pt': 'Entre em contato com o vendedor',
    },
    'z68ec0uj': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // resturantHome
  {
    'v59z9hey': {
      'en': 'Deliver to',
      'es': 'Entregar a',
      'fr': 'Livrer à',
      'pt': 'Entregar para',
    },
    '77h81jqc': {
      'en': 'MENU',
      'es': 'MENÚ',
      'fr': 'MENU',
      'pt': 'MENU',
    },
    'nb9xrl3s': {
      'en': 'Sort By',
      'es': 'Ordenar por',
      'fr': 'Trier par',
      'pt': 'Ordenar por',
    },
    'wj5fojnl': {
      'en': 'Veg',
      'es': 'Vegetales',
      'fr': 'Végétarien',
      'pt': 'Vegetais',
    },
    'lkrrmur0': {
      'en': 'Fish',
      'es': 'Pez',
      'fr': 'Poisson',
      'pt': 'Peixe',
    },
    'jjnqvhd7': {
      'en': 'Egg',
      'es': 'Huevo',
      'fr': 'Œuf',
      'pt': 'Ovo',
    },
    'q63mkcm7': {
      'en': 'Egg',
      'es': 'Huevo',
      'fr': 'Œuf',
      'pt': 'Ovo',
    },
    'rmmo5elt': {
      'en': 'Egg',
      'es': 'Huevo',
      'fr': 'Œuf',
      'pt': 'Ovo',
    },
    'b174prad': {
      'en': 'Combination Breakfast',
      'es': 'Desayuno combinado',
      'fr': 'Petit-déjeuner combiné',
      'pt': 'Café da manhã combinado',
    },
    'c9zsdpkn': {
      'en': 'meals',
      'es': 'comidas',
      'fr': 'repas',
      'pt': 'refeições',
    },
    'uus5thd2': {
      'en': 'meals',
      'es': 'comidas',
      'fr': 'repas',
      'pt': 'refeições',
    },
    'movou139': {
      'en': 'meals',
      'es': 'comidas',
      'fr': 'repas',
      'pt': 'refeições',
    },
    'ji0afw04': {
      'en': 'meals',
      'es': 'comidas',
      'fr': 'repas',
      'pt': 'refeições',
    },
    'ipw2rc7y': {
      'en': 'meals',
      'es': 'comidas',
      'fr': 'repas',
      'pt': 'refeições',
    },
    'varluwxs': {
      'en': 'meals',
      'es': 'comidas',
      'fr': 'repas',
      'pt': 'refeições',
    },
    '2kygzym5': {
      'en': 'meals',
      'es': 'comidas',
      'fr': 'repas',
      'pt': 'refeições',
    },
    'nc3bhada': {
      'en': 'Combination Breakfast',
      'es': 'Desayuno combinado',
      'fr': 'Petit-déjeuner combiné',
      'pt': 'Café da manhã combinado',
    },
    '3j6300un': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // resturantDetails
  {
    'vue1dnjo': {
      'en': '4.7',
      'es': '4.7',
      'fr': '4.7',
      'pt': '4.7',
    },
    '6kn50giv': {
      'en': 'Carbs',
      'es': 'Carbohidratos',
      'fr': 'Crabes',
      'pt': 'Carboidratos',
    },
    'eqdi2c9n': {
      'en': '4.7',
      'es': '4.7',
      'fr': '4.7',
      'pt': '4.7',
    },
    'ni8ax9jd': {
      'en': 'Carbs',
      'es': 'Carbohidratos',
      'fr': 'Crabes',
      'pt': 'Carboidratos',
    },
    'tlw0su4e': {
      'en': '4.7',
      'es': '4.7',
      'fr': '4.7',
      'pt': '4.7',
    },
    'yahtd6p3': {
      'en': 'Carbs',
      'es': 'Carbohidratos',
      'fr': 'Crabes',
      'pt': 'Carboidratos',
    },
    'wreupq1h': {
      'en': '4.7',
      'es': '4.7',
      'fr': '4.7',
      'pt': '4.7',
    },
    '57fy4cln': {
      'en': 'Carbs',
      'es': 'Carbohidratos',
      'fr': 'Crabes',
      'pt': 'Carboidratos',
    },
    'itmro042': {
      'en': 'Terms Of Service Of Storage',
      'es': 'Condiciones de servicio de almacenamiento',
      'fr': 'Conditions d\'utilisation du stockage',
      'pt': 'Termos de Serviço de Armazenamento',
    },
    'yz02nzo5': {
      'en':
          'Enjoy it warm or keep it in the refregirator.\nkeep them wrap up. let them cool fully',
      'es':
          'Disfrútelo caliente o guárdelo en el refrigerador. Manténgalos envueltos y déjelos enfriar completamente.',
      'fr':
          'Dégustez-les tièdes ou conservez-les au réfrigérateur.\nConservez-les bien emballés et laissez-les refroidir complètement.',
      'pt':
          'Aproveite-os mornos ou guarde-os na geladeira.\nMantenha-os embrulhados e deixe esfriar completamente.',
    },
    'ysnqzghj': {
      'en': 'Reviews',
      'es': 'Reseñas',
      'fr': 'Avis',
      'pt': 'Avaliações',
    },
    '8ykl06sz': {
      'en': 'ADD TO CART',
      'es': 'AÑADIR A LA CESTA',
      'fr': 'AJOUTER AU PANIER',
      'pt': 'ADICIONAR AO CARRINHO',
    },
    'oy150ap0': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // cart
  {
    '6yuouh8i': {
      'en': 'Cart',
      'es': 'Carro',
      'fr': 'Panier',
      'pt': 'Carrinho',
    },
    'pj1eyk2o': {
      'en': 'Order Summary',
      'es': 'Resumen del pedido',
      'fr': 'Résumé de la commande',
      'pt': 'Resumo do pedido',
    },
    'by2lto9c': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    'b2vgtwqp': {
      'en': 'Price',
      'es': 'Precio',
      'fr': 'Prix',
      'pt': 'Preço',
    },
    'd7ieyeej': {
      'en': 'ORDER NOW',
      'es': 'ORDENAR AHORA',
      'fr': 'COMMANDEZ MAINTENANT',
      'pt': 'ENCOMENDE AGORA',
    },
    'y9aq472b': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // success
  {
    'xx0691oj': {
      'en': 'Success',
      'es': 'Éxito',
      'fr': 'Succès',
      'pt': 'Sucesso',
    },
    'ofbb9pl1': {
      'en': 'Your Order is Placed',
      'es': 'Su pedido ha sido realizado',
      'fr': 'Votre commande est passée',
      'pt': 'Seu pedido foi feito',
    },
    'tut0y41s': {
      'en': 'Check your Order',
      'es': 'Revisa tu pedido',
      'fr': 'Vérifiez votre commande',
      'pt': 'Verifique seu pedido',
    },
    '7kb4x3ld': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // notificationrestu
  {
    'ugghjng3': {
      'en': 'Notification',
      'es': 'Notificación',
      'fr': 'Notification',
      'pt': 'Notificação',
    },
    'ph3pcm6z': {
      'en': 'Track Order',
      'es': 'Seguimiento de pedidos',
      'fr': 'Suivi de commande',
      'pt': 'Acompanhar pedido',
    },
    'utmy9q77': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // profileforResturant
  {
    '8a9a3woo': {
      'en': 'Address',
      'es': 'DIRECCIÓN',
      'fr': 'Adresse',
      'pt': 'Endereço',
    },
    'ntzd0hct': {
      'en': 'Order history',
      'es': 'Historial de pedidos',
      'fr': 'Historique des commandes',
      'pt': 'Histórico de pedidos',
    },
    'tzz9428s': {
      'en': 'Payments',
      'es': 'Pagos',
      'fr': 'Paiements',
      'pt': 'Pagamentos',
    },
    'xxlzwuyp': {
      'en': 'Table Reservation',
      'es': 'Reserva de mesa',
      'fr': 'Réservation de table',
      'pt': 'Reserva de mesa',
    },
    'qnkmmmfy': {
      'en': 'Food Planner',
      'es': 'Planificador de comidas',
      'fr': 'Planificateur alimentaire',
      'pt': 'Planejador de Alimentos',
    },
    'cntzh9es': {
      'en': 'Contact Us',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
      'pt': 'Contate-nos',
    },
    '6xluwxty': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // ttt
  {
    'd5o2d3u2': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // myEvent
  {
    '4cvphief': {
      'en': 'My Events',
      'es': 'Mis eventos',
      'fr': 'Mes événements',
      'pt': 'Meus Eventos',
    },
    'b6v5nmgl': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // LisEvents
  {
    'not5lp4w': {
      'en': 'Special Deal',
      'es': 'Oferta especial',
      'fr': 'Offre spéciale',
      'pt': 'Oferta especial',
    },
    'b997apc1': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // LisEventspecialdeal
  {
    '5n5z1p0w': {
      'en': 'Special Deal',
      'es': 'Oferta especial',
      'fr': 'Offre spéciale',
      'pt': 'Oferta especial',
    },
    'gcyww85z': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // LisEventforyou
  {
    '3qzhd8xj': {
      'en': 'Event For You',
      'es': 'Evento para ti',
      'fr': 'Un événement pour vous',
      'pt': 'Evento para você',
    },
    '0msus3om': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // LisEventcatigory
  {
    '8l1f3gvn': {
      'en': 'Sport',
      'es': 'Deporte',
      'fr': 'Sport',
      'pt': 'Esporte',
    },
    'r2epciz2': {
      'en': 'Food',
      'es': 'Alimento',
      'fr': 'Nourriture',
      'pt': 'Comida',
    },
    'c5bdrkl5': {
      'en': 'Events For You',
      'es': 'Eventos para ti',
      'fr': 'Des événements pour vous',
      'pt': 'Eventos para você',
    },
    'd3rut40v': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // ProfilesComunity
  {
    '2op8x1e6': {
      'en': 'Profile',
      'es': 'Perfil',
      'fr': 'Profil',
      'pt': 'Perfil',
    },
    'ym7div6g': {
      'en': 'Follow',
      'es': 'Seguir',
      'fr': 'Suivre',
      'pt': 'Seguir',
    },
    'rv2dz9xa': {
      'en': 'Unfollow',
      'es': 'Dejar de seguir',
      'fr': 'Ne plus suivre',
      'pt': 'Deixar de seguir',
    },
    'oubymq6x': {
      'en': 'Bio',
      'es': 'Biografía',
      'fr': 'Biographie',
      'pt': 'Biografia',
    },
    'o7uxg1zx': {
      'en': 'Posts',
      'es': 'Publicaciones',
      'fr': 'Articles',
      'pt': 'Postagens',
    },
    '41oeyxsr': {
      'en': 'Media',
      'es': 'Medios de comunicación',
      'fr': 'Médias',
      'pt': 'Mídia',
    },
    's0p07qaa': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // galleryComunity
  {
    'x989p4sa': {
      'en': 'Gallery',
      'es': 'Galería',
      'fr': 'Galerie',
      'pt': 'Galeria',
    },
    'c98czxv3': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // communitychat
  {
    'vvozx4je': {
      'en': 'type your message',
      'es': 'Escribe tu mensaje',
      'fr': 'tapez votre message',
      'pt': 'digite sua mensagem',
    },
    'e3t6wr67': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // communitychatlist
  {
    'idhqn01u': {
      'en': 'chat',
      'es': 'charlar',
      'fr': 'chat',
      'pt': 'bater papo',
    },
    'pqxs2bdw': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // chatproduct
  {
    'l3pubpvu': {
      'en': 'type your message',
      'es': 'Escribe tu mensaje',
      'fr': 'tapez votre message',
      'pt': 'digite sua mensagem',
    },
    'sa160rfr': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // marketproductlist
  {
    'f6xbyzxv': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // marketproductlistCatigory
  {
    'k27kjzbk': {
      'en': 'Popular product',
      'es': 'Producto popular',
      'fr': 'Produit populaire',
      'pt': 'Produto popular',
    },
    'yzqt74r4': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // resurantorder
  {
    'q9ktsl2b': {
      'en': 'Order Management',
      'es': 'Gestión de pedidos',
      'fr': 'Gestion des commandes',
      'pt': 'Gerenciamento de pedidos',
    },
    'pg8dmlgk': {
      'en': 'Orders',
      'es': 'Pedidos',
      'fr': 'Ordres',
      'pt': 'Pedidos',
    },
    'm7jkywg8': {
      'en': 'Delivery',
      'es': 'Entrega',
      'fr': 'Livraison',
      'pt': 'Entrega',
    },
    '5dm9k4dr': {
      'en': 'Completed',
      'es': 'Terminado',
      'fr': 'Complété',
      'pt': 'Concluído',
    },
    'gr2u33oc': {
      'en': 'No pickles, extra sauce',
      'es': 'Sin pepinillos, salsa extra',
      'fr': 'Pas de cornichons, sauce supplémentaire',
      'pt': 'Sem picles, molho extra',
    },
    '55khmkh8': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    'ui6ur9cw': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
    '6cb0xuvh': {
      'en': 'Preparing',
      'es': 'Preparante',
      'fr': 'Préparation',
      'pt': 'Preparando',
    },
    'xs94xp37': {
      'en': 'Order #1232',
      'es': 'Pedido #1232',
      'fr': 'Commande n° 1232',
      'pt': 'Pedido nº 1232',
    },
    '4pfud9w3': {
      'en': 'Placed 20 minutes ago',
      'es': 'Colocado hace 20 minutos',
      'fr': 'Publié il y a 20 minutes',
      'pt': 'Colocado há 20 minutos',
    },
    'm1mx3ld7': {
      'en': '\$32.75',
      'es': '\$32.75',
      'fr': '32,75 \$',
      'pt': '\$ 32,75',
    },
    'ynco3yrg': {
      'en': 'Caesar Salad',
      'es': 'Ensalada Cesar',
      'fr': 'Salade César',
      'pt': 'Salada Caesar',
    },
    'zagb11i5': {
      'en': 'No croutons',
      'es': 'Sin crutones',
      'fr': 'Pas de croûtons',
      'pt': 'Sem croutons',
    },
    'dwsgkpa3': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    '9oo70aks': {
      'en': 'Ribeye Steak',
      'es': 'Filete de costilla',
      'fr': 'Steak de faux-filet',
      'pt': 'Bife Ribeye',
    },
    'a2okytti': {
      'en': 'Medium rare, mashed potatoes',
      'es': 'Puré de papas poco hecho',
      'fr': 'Purée de pommes de terre mi-saignante',
      'pt': 'Purê de batatas malpassado',
    },
    'xs3bbmqc': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    'mpxb7gij': {
      'en': 'Mark Ready',
      'es': 'Marcar listo',
      'fr': 'Marquer comme prêt',
      'pt': 'Marca pronta',
    },
    'swcr461l': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
    's5d58tzd': {
      'en': 'No pickles, extra sauce',
      'es': 'Sin pepinillos, salsa extra',
      'fr': 'Pas de cornichons, sauce supplémentaire',
      'pt': 'Sem picles, molho extra',
    },
    'jxs3gagh': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    'xy42rcax': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
    'ca69tgfz': {
      'en': 'Preparing',
      'es': 'Preparante',
      'fr': 'Préparation',
      'pt': 'Preparando',
    },
    'vugtgcd6': {
      'en': 'Order #1232',
      'es': 'Pedido #1232',
      'fr': 'Commande n° 1232',
      'pt': 'Pedido nº 1232',
    },
    'okov754o': {
      'en': 'Placed 20 minutes ago',
      'es': 'Colocado hace 20 minutos',
      'fr': 'Publié il y a 20 minutes',
      'pt': 'Colocado há 20 minutos',
    },
    '28gg0t7j': {
      'en': '\$32.75',
      'es': '\$32.75',
      'fr': '32,75 \$',
      'pt': '\$ 32,75',
    },
    'g6o6bw9p': {
      'en': 'Caesar Salad',
      'es': 'Ensalada Cesar',
      'fr': 'Salade César',
      'pt': 'Salada Caesar',
    },
    'hqh2c9kf': {
      'en': 'No croutons',
      'es': 'Sin crutones',
      'fr': 'Pas de croûtons',
      'pt': 'Sem croutons',
    },
    'qlyvh7sz': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    'dupky6ce': {
      'en': 'Ribeye Steak',
      'es': 'Filete de costilla',
      'fr': 'Steak de faux-filet',
      'pt': 'Bife Ribeye',
    },
    'hglki32v': {
      'en': 'Medium rare, mashed potatoes',
      'es': 'Puré de papas poco hecho',
      'fr': 'Purée de pommes de terre mi-saignante',
      'pt': 'Purê de batatas malpassado',
    },
    '7o88k2tu': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    '9pe6cjmv': {
      'en': 'Mark Ready',
      'es': 'Marcar listo',
      'fr': 'Marquer comme prêt',
      'pt': 'Marca pronta',
    },
    'oo3z3u0y': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
    'mfiih8tw': {
      'en': 'No pickles, extra sauce',
      'es': 'Sin pepinillos, salsa extra',
      'fr': 'Pas de cornichons, sauce supplémentaire',
      'pt': 'Sem picles, molho extra',
    },
    'kz6sxbdq': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    'z70ipnel': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
    '3rklpl3q': {
      'en': 'Preparing',
      'es': 'Preparante',
      'fr': 'Préparation',
      'pt': 'Preparando',
    },
    '6lgn4of0': {
      'en': 'Order #1232',
      'es': 'Pedido #1232',
      'fr': 'Commande n° 1232',
      'pt': 'Pedido nº 1232',
    },
    '1bz7j773': {
      'en': 'Placed 20 minutes ago',
      'es': 'Colocado hace 20 minutos',
      'fr': 'Publié il y a 20 minutes',
      'pt': 'Colocado há 20 minutos',
    },
    '2iw91m91': {
      'en': '\$32.75',
      'es': '\$32.75',
      'fr': '32,75 \$',
      'pt': '\$ 32,75',
    },
    'zk6l3lkm': {
      'en': 'Caesar Salad',
      'es': 'Ensalada Cesar',
      'fr': 'Salade César',
      'pt': 'Salada Caesar',
    },
    's4povk1q': {
      'en': 'No croutons',
      'es': 'Sin crutones',
      'fr': 'Pas de croûtons',
      'pt': 'Sem croutons',
    },
    'n7iv17vv': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    'klywmflw': {
      'en': 'Ribeye Steak',
      'es': 'Filete de costilla',
      'fr': 'Steak de faux-filet',
      'pt': 'Bife Ribeye',
    },
    'pmi8nz8u': {
      'en': 'Medium rare, mashed potatoes',
      'es': 'Puré de papas poco hecho',
      'fr': 'Purée de pommes de terre mi-saignante',
      'pt': 'Purê de batatas malpassado',
    },
    '4hqro4ml': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    'sa7g7gtk': {
      'en': 'Mark Ready',
      'es': 'Marcar listo',
      'fr': 'Marquer comme prêt',
      'pt': 'Marca pronta',
    },
    'fwe2b4o2': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
  },
  // orderdetails
  {
    '3yvzywfq': {
      'en': 'Order Details',
      'es': 'Detalles del pedido',
      'fr': 'Détails de la commande',
      'pt': 'Detalhes do pedido',
    },
    'ybgmfuz8': {
      'en': 'Order Date:',
      'es': 'Fecha del pedido:',
      'fr': 'Date de commande :',
      'pt': 'Data do pedido:',
    },
    'nl1n89x0': {
      'en': 'Payment Method:',
      'es': 'Método de pago:',
      'fr': 'Mode de paiement:',
      'pt': 'Método de pagamento:',
    },
    '04fpva95': {
      'en': 'custom',
      'es': 'costumbre',
      'fr': 'coutume',
      'pt': 'personalizado',
    },
    '6qf6cvh1': {
      'en': 'Total Amount:',
      'es': 'Importe total:',
      'fr': 'Montant total:',
      'pt': 'Montante total:',
    },
    'oxwmhy66': {
      'en': 'Buyer Information',
      'es': 'Información del comprador',
      'fr': 'Informations sur l\'acheteur',
      'pt': 'Informações do comprador',
    },
    'olt0redo': {
      'en': 'Name',
      'es': 'Nombre',
      'fr': 'Nom',
      'pt': 'Nome',
    },
    's5t4cplq': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
      'pt': 'Número de telefone',
    },
    'qzy46i0m': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'pt': 'E-mail',
    },
    'bx7e74vl': {
      'en': ' Address',
      'es': 'DIRECCIÓN',
      'fr': 'Adresse',
      'pt': 'Endereço',
    },
    'lshz4xet': {
      'en': 'Ordered Items',
      'es': 'Artículos pedidos',
      'fr': 'Articles commandés',
      'pt': 'Itens encomendados',
    },
    '6as6yuye': {
      'en': 'Mark as completed',
      'es': 'Marcar como completado',
      'fr': 'Marquer comme terminé',
      'pt': 'Marcar como concluído',
    },
  },
  // orderdetailsbuyer
  {
    'sdmjmotc': {
      'en': 'Order Details',
      'es': 'Detalles del pedido',
      'fr': 'Détails de la commande',
      'pt': 'Detalhes do pedido',
    },
    'm54f0etk': {
      'en': 'Order Date:',
      'es': 'Fecha del pedido:',
      'fr': 'Date de commande :',
      'pt': 'Data do pedido:',
    },
    'xsslrui4': {
      'en': 'Payment Method:',
      'es': 'Método de pago:',
      'fr': 'Mode de paiement:',
      'pt': 'Método de pagamento:',
    },
    '822bwzkk': {
      'en': 'custom',
      'es': 'costumbre',
      'fr': 'coutume',
      'pt': 'personalizado',
    },
    '58kri799': {
      'en': 'Total Amount:',
      'es': 'Importe total:',
      'fr': 'Montant total:',
      'pt': 'Montante total:',
    },
    'r68c1qrs': {
      'en': 'Seller Information',
      'es': 'Información del vendedor',
      'fr': 'Informations sur le vendeur',
      'pt': 'Informações do vendedor',
    },
    'a7y5ncbq': {
      'en': 'Name',
      'es': 'Nombre',
      'fr': 'Nom',
      'pt': 'Nome',
    },
    'b00tj9ls': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
      'pt': 'Número de telefone',
    },
    'ku217hmr': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'pt': 'E-mail',
    },
    '9y89birj': {
      'en': 'Restaurant Address',
      'es': 'Dirección del restaurante',
      'fr': 'Adresse du restaurant',
      'pt': 'Endereço do restaurante',
    },
    'y6t0ns6c': {
      'en': 'Order Items',
      'es': 'Artículos del pedido',
      'fr': 'Articles de commande',
      'pt': 'Itens do pedido',
    },
    'x7gtuusn': {
      'en': 'Give Review',
      'es': 'Dar reseña',
      'fr': 'Donner un avis',
      'pt': 'Dê uma avaliação',
    },
  },
  // resurantorderbuyer
  {
    'sufo2ctj': {
      'en': 'Order Management',
      'es': 'Gestión de pedidos',
      'fr': 'Gestion des commandes',
      'pt': 'Gerenciamento de pedidos',
    },
    '3cz85zo1': {
      'en': 'My Orders',
      'es': 'Mis pedidos',
      'fr': 'Mes commandes',
      'pt': 'Meus Pedidos',
    },
    '128c5gem': {
      'en': 'Delivery',
      'es': 'Entrega',
      'fr': 'Livraison',
      'pt': 'Entrega',
    },
    'x1a4a6ez': {
      'en': 'Completed',
      'es': 'Terminado',
      'fr': 'Complété',
      'pt': 'Concluído',
    },
    '3v7v8xgg': {
      'en': 'No pickles, extra sauce',
      'es': 'Sin pepinillos, salsa extra',
      'fr': 'Pas de cornichons, sauce supplémentaire',
      'pt': 'Sem picles, molho extra',
    },
    'pvaiv4r1': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    'kz6m075t': {
      'en': 'contact Seller',
      'es': 'Contactar al vendedor',
      'fr': 'contacter le vendeur',
      'pt': 'entre em contato com o vendedor',
    },
    'lqv0i02i': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
    'q05n6zo5': {
      'en': 'Preparing',
      'es': 'Preparante',
      'fr': 'Préparation',
      'pt': 'Preparando',
    },
    'e6i9k35i': {
      'en': 'Order #1232',
      'es': 'Pedido #1232',
      'fr': 'Commande n° 1232',
      'pt': 'Pedido nº 1232',
    },
    'x3ixeuh4': {
      'en': 'Placed 20 minutes ago',
      'es': 'Colocado hace 20 minutos',
      'fr': 'Publié il y a 20 minutes',
      'pt': 'Colocado há 20 minutos',
    },
    '5pl4ch1v': {
      'en': '\$32.75',
      'es': '\$32.75',
      'fr': '32,75 \$',
      'pt': '\$ 32,75',
    },
    'zih8bicf': {
      'en': 'Caesar Salad',
      'es': 'Ensalada Cesar',
      'fr': 'Salade César',
      'pt': 'Salada Caesar',
    },
    'j5rnx3k1': {
      'en': 'No croutons',
      'es': 'Sin crutones',
      'fr': 'Pas de croûtons',
      'pt': 'Sem croutons',
    },
    'deg92hji': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    'cesgknfg': {
      'en': 'Ribeye Steak',
      'es': 'Filete de costilla',
      'fr': 'Steak de faux-filet',
      'pt': 'Bife Ribeye',
    },
    'gz5emqc1': {
      'en': 'Medium rare, mashed potatoes',
      'es': 'Puré de papas poco hecho',
      'fr': 'Purée de pommes de terre mi-saignante',
      'pt': 'Purê de batatas malpassado',
    },
    '40n8dutr': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    'yn6q8ihh': {
      'en': 'Mark Ready',
      'es': 'Marcar listo',
      'fr': 'Marquer comme prêt',
      'pt': 'Marca pronta',
    },
    'qjy2r0la': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
    'll20jj8l': {
      'en': 'No pickles, extra sauce',
      'es': 'Sin pepinillos, salsa extra',
      'fr': 'Pas de cornichons, sauce supplémentaire',
      'pt': 'Sem picles, molho extra',
    },
    'fovclb8n': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    '7lylff05': {
      'en': 'contact Seller',
      'es': 'Contactar al vendedor',
      'fr': 'contacter le vendeur',
      'pt': 'entre em contato com o vendedor',
    },
    'og76s7g5': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
    '7604dny7': {
      'en': 'Preparing',
      'es': 'Preparante',
      'fr': 'Préparation',
      'pt': 'Preparando',
    },
    'kzgj14e0': {
      'en': 'Order #1232',
      'es': 'Pedido #1232',
      'fr': 'Commande n° 1232',
      'pt': 'Pedido nº 1232',
    },
    'xcqrne37': {
      'en': 'Placed 20 minutes ago',
      'es': 'Colocado hace 20 minutos',
      'fr': 'Publié il y a 20 minutes',
      'pt': 'Colocado há 20 minutos',
    },
    '105089pi': {
      'en': '\$32.75',
      'es': '\$32.75',
      'fr': '32,75 \$',
      'pt': '\$ 32,75',
    },
    'riq5zkem': {
      'en': 'Caesar Salad',
      'es': 'Ensalada Cesar',
      'fr': 'Salade César',
      'pt': 'Salada Caesar',
    },
    'ccijig9x': {
      'en': 'No croutons',
      'es': 'Sin crutones',
      'fr': 'Pas de croûtons',
      'pt': 'Sem croutons',
    },
    'kekzcjgi': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    'g0weman8': {
      'en': 'Ribeye Steak',
      'es': 'Filete de costilla',
      'fr': 'Steak de faux-filet',
      'pt': 'Bife Ribeye',
    },
    '0gjo8sg4': {
      'en': 'Medium rare, mashed potatoes',
      'es': 'Puré de papas poco hecho',
      'fr': 'Purée de pommes de terre mi-saignante',
      'pt': 'Purê de batatas malpassado',
    },
    'jtroy1bf': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    '2kopzqss': {
      'en': 'Mark Ready',
      'es': 'Marcar listo',
      'fr': 'Marquer comme prêt',
      'pt': 'Marca pronta',
    },
    '7lsvv71n': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
    'qpvzuga7': {
      'en': 'No pickles, extra sauce',
      'es': 'Sin pepinillos, salsa extra',
      'fr': 'Pas de cornichons, sauce supplémentaire',
      'pt': 'Sem picles, molho extra',
    },
    '31duihi0': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    'wtbnlj8z': {
      'en': 'contact Seller',
      'es': 'Contactar al vendedor',
      'fr': 'contacter le vendeur',
      'pt': 'entre em contato com o vendedor',
    },
    'wxvgdhn9': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
    'ii26b0e9': {
      'en': 'Preparing',
      'es': 'Preparante',
      'fr': 'Préparation',
      'pt': 'Preparando',
    },
    '4gedrffe': {
      'en': 'Order #1232',
      'es': 'Pedido #1232',
      'fr': 'Commande n° 1232',
      'pt': 'Pedido nº 1232',
    },
    'ghmrm9qg': {
      'en': 'Placed 20 minutes ago',
      'es': 'Colocado hace 20 minutos',
      'fr': 'Publié il y a 20 minutes',
      'pt': 'Colocado há 20 minutos',
    },
    '15p8m1gm': {
      'en': '\$32.75',
      'es': '\$32.75',
      'fr': '32,75 \$',
      'pt': '\$ 32,75',
    },
    'u3cozq25': {
      'en': 'Caesar Salad',
      'es': 'Ensalada Cesar',
      'fr': 'Salade César',
      'pt': 'Salada Caesar',
    },
    'z8gto2rb': {
      'en': 'No croutons',
      'es': 'Sin crutones',
      'fr': 'Pas de croûtons',
      'pt': 'Sem croutons',
    },
    'mhoy6dpc': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    'shatqncz': {
      'en': 'Ribeye Steak',
      'es': 'Filete de costilla',
      'fr': 'Steak de faux-filet',
      'pt': 'Bife Ribeye',
    },
    'f44jomd2': {
      'en': 'Medium rare, mashed potatoes',
      'es': 'Puré de papas poco hecho',
      'fr': 'Purée de pommes de terre mi-saignante',
      'pt': 'Purê de batatas malpassado',
    },
    '5tisxgkp': {
      'en': 'Qty: 1',
      'es': 'Cantidad: 1',
      'fr': 'Qté : 1',
      'pt': 'Qtd: 1',
    },
    'oi4gm3za': {
      'en': 'Mark Ready',
      'es': 'Marcar listo',
      'fr': 'Marquer comme prêt',
      'pt': 'Marca pronta',
    },
    'mrofffy2': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
  },
  // menu
  {
    's017wtug': {
      'en': 'Menu',
      'es': 'Menú',
      'fr': 'Menu',
      'pt': 'Menu',
    },
    '7e7c3ud6': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
    'qn687gm7': {
      'en': 'My Profile',
      'es': 'Mi perfil',
      'fr': 'Mon profil',
      'pt': 'Meu Perfil',
    },
    'ymhhlrux': {
      'en': 'MarketPlace',
      'es': 'Mercado',
      'fr': 'Marché',
      'pt': 'Mercado',
    },
    's0n5spms': {
      'en': 'Community',
      'es': 'Comunidad',
      'fr': 'Communauté',
      'pt': 'Comunidade',
    },
    'a8qcuoji': {
      'en': 'Business',
      'es': 'Negocio',
      'fr': 'Entreprise',
      'pt': 'Negócios',
    },
    'nanvpz1m': {
      'en': 'Event',
      'es': 'Evento',
      'fr': 'Événement',
      'pt': 'Evento',
    },
    'wpah3kju': {
      'en': 'Verification',
      'es': 'Verificación',
      'fr': 'Vérification',
      'pt': 'Verificação',
    },
    'krq77o57': {
      'en': 'Messages',
      'es': 'Mensajes',
      'fr': 'Messages',
      'pt': 'Mensagens',
    },
    '53eun6xh': {
      'en': 'Notifications',
      'es': 'Notificaciones',
      'fr': 'Notifications',
      'pt': 'Notificações',
    },
    '8xolnev4': {
      'en': 'Settings',
      'es': 'Ajustes',
      'fr': 'Paramètres',
      'pt': 'Configurações',
    },
    '7xiat51g': {
      'en': 'Help & Support',
      'es': 'Ayuda y soporte',
      'fr': 'Aide et support',
      'pt': 'Ajuda e Suporte',
    },
    'bzmpq9vj': {
      'en': 'About',
      'es': 'Acerca de',
      'fr': 'À propos',
      'pt': 'Sobre',
    },
    'laztdutg': {
      'en': 'Log Out',
      'es': 'Finalizar la sesión',
      'fr': 'Se déconnecter',
      'pt': 'Sair',
    },
  },
  // myproduct
  {
    'enwo1ki8': {
      'en': 'My Product(s)',
      'es': 'Mis productos',
      'fr': 'Mes produits',
      'pt': 'Meu(s) Produto(s)',
    },
    '6dlhs1zh': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // comunityListmy
  {
    'p2bif0xc': {
      'en': 'My Community ',
      'es': 'Mi comunidad',
      'fr': 'Ma communauté',
      'pt': 'Minha Comunidade',
    },
    'ahol8x0c': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // MyResturant
  {
    '2b8vyudf': {
      'en': 'My Resturant',
      'es': 'Mi restaurante',
      'fr': 'Mon restaurant',
      'pt': 'Meu Restaurante',
    },
    '7n0ftvcz': {
      'en': 'My Menu',
      'es': 'Mi menú',
      'fr': 'Mon menu',
      'pt': 'Meu Menu',
    },
    'leurp8q1': {
      'en': 'Add menu',
      'es': 'Añadir menú',
      'fr': 'Ajouter un menu',
      'pt': 'Adicionar menu',
    },
    'oqcx5qxx': {
      'en': 'My Recipe',
      'es': 'Mi receta',
      'fr': 'Ma recette',
      'pt': 'Minha Receita',
    },
    'sjwrg099': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // chatone
  {
    '6q5tynir': {
      'en': 'type your message',
      'es': 'Escribe tu mensaje',
      'fr': 'tapez votre message',
      'pt': 'digite sua mensagem',
    },
    '3r2ky7jl': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // chat
  {
    '2kjo7w30': {
      'en': 'Chat',
      'es': 'Charlar',
      'fr': 'Chat',
      'pt': 'Bater papo',
    },
    'e5avsnlc': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // bussiness
  {
    'a96l942z': {
      'en': 'Location',
      'es': 'Ubicación',
      'fr': 'Emplacement',
      'pt': 'Localização',
    },
    'ckxamse5': {
      'en': 'Contact',
      'es': 'Contacto',
      'fr': 'Contact',
      'pt': 'Contato',
    },
    'vzcqywhz': {
      'en': 'About Us',
      'es': 'Sobre nosotros',
      'fr': 'À propos de nous',
      'pt': 'Sobre nós',
    },
    '4z96mksr': {
      'en': 'Contact Us',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
      'pt': 'Contate-nos',
    },
    'eicm9f7c': {
      'en': 'Reviews',
      'es': 'Reseñas',
      'fr': 'Avis',
      'pt': 'Avaliações',
    },
  },
  // mybusineslist
  {
    '2ln7z059': {
      'en': 'My Business',
      'es': 'Mi negocio',
      'fr': 'Mon entreprise',
      'pt': 'Meu Negócio',
    },
    'yxo8zxf6': {
      'en': 'Search businesses...',
      'es': 'Buscar negocios...',
      'fr': 'Rechercher des entreprises...',
      'pt': 'Pesquisar empresas...',
    },
    'tte3b5zf': {
      'en': 'Directions',
      'es': 'Instrucciones',
      'fr': 'Instructions',
      'pt': 'Instruções',
    },
    'us1wdvf8': {
      'en': 'Call',
      'es': 'Llamar',
      'fr': 'Appel',
      'pt': 'Chamar',
    },
    'yjqkiqli': {
      'en': 'Website',
      'es': 'Sitio web',
      'fr': 'Site web',
      'pt': 'Site',
    },
  },
  // EditBusiness
  {
    'vyphyuc6': {
      'en': 'Drop your business image here or browse',
      'es': 'Deja aquí la imagen de tu negocio o navega',
      'fr': 'Déposez l\'image de votre entreprise ici ou parcourez',
      'pt': 'Solte a imagem da sua empresa aqui ou navegue',
    },
    '2kjrcmnz': {
      'en': 'Business Name',
      'es': 'Nombre de la empresa',
      'fr': 'Nom de l\'entreprise',
      'pt': 'Nome da empresa',
    },
    'c8t2jxgo': {
      'en': 'Business Name',
      'es': 'Nombre de la empresa',
      'fr': 'Nom de l\'entreprise',
      'pt': 'Nome da empresa',
    },
    'vawqz356': {
      'en': 'Select Category',
      'es': 'Seleccionar categoría',
      'fr': 'Sélectionnez une catégorie',
      'pt': 'Selecione a categoria',
    },
    '12plbkqo': {
      'en': 'Select Category',
      'es': 'Seleccionar categoría',
      'fr': 'Sélectionnez une catégorie',
      'pt': 'Selecione a categoria',
    },
    'g978n81i': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
      'pt': 'Procurar...',
    },
    'o7s8knuq': {
      'en': 'Real Estate',
      'es': 'Bienes raíces',
      'fr': 'Immobilier',
      'pt': 'Imobiliária',
    },
    'q5b9zvsl': {
      'en': 'Automotive',
      'es': 'Automotor',
      'fr': 'Automobile',
      'pt': 'Automotivo',
    },
    '0wy07slb': {
      'en': 'Business Support',
      'es': 'Apoyo empresarial',
      'fr': 'Soutien aux entreprises',
      'pt': 'Suporte Empresarial',
    },
    'bj3zzkqj': {
      'en': 'Computers and Electronics',
      'es': 'Computadoras y electrónica',
      'fr': 'Informatique et électronique',
      'pt': 'Computadores e Eletrônicos',
    },
    'si7z99pa': {
      'en': 'Construction and Contractors',
      'es': 'Construcción y contratistas',
      'fr': 'Construction et entrepreneurs',
      'pt': 'Construção e Empreiteiros',
    },
    'ii9hbq5c': {
      'en': 'Education',
      'es': 'Educación',
      'fr': 'Éducation',
      'pt': 'Educação',
    },
    'j72lgr1d': {
      'en': 'Entertainment',
      'es': 'Entretenimiento',
      'fr': 'Divertissement',
      'pt': 'Entretenimento',
    },
    'taqkghs5': {
      'en': 'Food & Dinning',
      'es': 'Comida y cena',
      'fr': 'Nourriture et restauration',
      'pt': 'Comida e Jantar',
    },
    'yss549ar': {
      'en': 'Health and Medicine',
      'es': 'Salud y Medicina',
      'fr': 'Santé et médecine',
      'pt': 'Saúde e Medicina',
    },
    'ot4ut0m1': {
      'en': 'Home & Garden',
      'es': 'Hogar y jardín',
      'fr': 'Maison et jardin',
      'pt': 'Casa e Jardim',
    },
    'd1uftbew': {
      'en': 'Legal & Finance',
      'es': 'Legal y Finanzas',
      'fr': 'Juridique et financier',
      'pt': 'Jurídico e Financeiro',
    },
    'h4pk31ai': {
      'en': 'Merchant (Retail)',
      'es': 'Comerciante (minorista)',
      'fr': 'Commerçant (détail)',
      'pt': 'Comerciante (Varejo)',
    },
    '0i65na95': {
      'en': 'Miscellaneous',
      'es': 'Misceláneas',
      'fr': 'Divers',
      'pt': 'Variado',
    },
    '70gvpp2k': {
      'en': 'Personal Care & Services',
      'es': 'Cuidado personal y servicios',
      'fr': 'Soins et services personnels',
      'pt': 'Cuidados e Serviços Pessoais',
    },
    'xn83qocs': {
      'en': 'Business Description',
      'es': 'Descripción del negocio',
      'fr': 'Description de l\'entreprise',
      'pt': 'Descrição do negócio',
    },
    'o2m0zsqp': {
      'en': 'Business description',
      'es': 'Descripción del negocio',
      'fr': 'Description de l\'entreprise',
      'pt': 'Descrição do negócio',
    },
    'wpcl5743': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'pt': 'E-mail',
    },
    'f6r6rnrm': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse email',
      'pt': 'Endereço de email',
    },
    'osi3zs3c': {
      'en': 'Address',
      'es': 'DIRECCIÓN',
      'fr': 'Adresse',
      'pt': 'Endereço',
    },
    '4p64ybdu': {
      'en': 'Business Address',
      'es': 'Dirección comercial',
      'fr': 'Adresse de l\'entreprise',
      'pt': 'Endereço comercial',
    },
    'r01gqvi2': {
      'en': 'Country',
      'es': 'País',
      'fr': 'Pays',
      'pt': 'País',
    },
    'camh1ep6': {
      'en': 'Business Country',
      'es': 'País de negocios',
      'fr': 'Pays d\'affaires',
      'pt': 'País de negócios',
    },
    'e1aipgmu': {
      'en': 'Google map link to your business',
      'es': 'Enlace del mapa de Google a su negocio',
      'fr': 'Lien Google Map vers votre entreprise',
      'pt': 'Link do Google Maps para sua empresa',
    },
    'tjrwwg91': {
      'en': 'Google map link',
      'es': 'Enlace al mapa de Google',
      'fr': 'Lien vers la carte Google',
      'pt': 'Link do mapa do Google',
    },
    'q1up26f2': {
      'en': 'Buisness Website',
      'es': 'Sitio web empresarial',
      'fr': 'Site Web d\'entreprise',
      'pt': 'Site de negócios',
    },
    'zm5jdbud': {
      'en': 'Website URL',
      'es': 'URL del sitio web',
      'fr': 'URL du site Web',
      'pt': 'URL do site',
    },
    '35fq0dg5': {
      'en': 'Whatsapp Number',
      'es': 'Número de WhatsApp',
      'fr': 'Numéro Whatsapp',
      'pt': 'Número do Whatsapp',
    },
    'z0z1n273': {
      'en': 'Whatsapp Number',
      'es': 'Número de WhatsApp',
      'fr': 'Numéro Whatsapp',
      'pt': 'Número do Whatsapp',
    },
    '6pgbfahk': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
      'pt': 'Número de telefone',
    },
    'iy61oqi9': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
      'pt': 'Número de telefone',
    },
    '7ur8rc8n': {
      'en': 'Save',
      'es': 'Ahorrar',
      'fr': 'Sauvegarder',
      'pt': 'Salvar',
    },
    'sqe36uvp': {
      'en': 'List a Business',
      'es': 'Listar un negocio',
      'fr': 'Lister une entreprise',
      'pt': 'Listar uma empresa',
    },
    'rrr6trri': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // LisEventsCatigory
  {
    '7hbh4qhm': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // marketchatlist
  {
    'w8dpheck': {
      'en': 'Chat',
      'es': 'Charlar',
      'fr': 'Chat',
      'pt': 'Bater papo',
    },
    'e1259d7t': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // Addmember2
  {
    'a7lr2ext': {
      'en': 'Create a new Group',
      'es': 'Crear un nuevo grupo',
      'fr': 'Créer un nouveau groupe',
      'pt': 'Criar um novo grupo',
    },
    'jzg1oslf': {
      'en': 'Select members to add to community',
      'es': 'Seleccione miembros para agregarlos a la comunidad',
      'fr': 'Sélectionnez les membres à ajouter à la communauté',
      'pt': 'Selecione membros para adicionar à comunidade',
    },
    't1ylax78': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // Resturantmenu
  {
    'xutkxdm9': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // Resturantmenusearch
  {
    'md7ipwej': {
      'en': 'search',
      'es': 'buscar',
      'fr': 'recherche',
      'pt': 'procurar',
    },
    'x6zkw7mh': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // Hub
  {
    'k7z75xwx': {
      'en': 'Find \nPeople',
      'es': 'Encontrar\npersonas',
      'fr': 'Trouver des personnes',
      'pt': 'Encontrar\nPessoas',
    },
    'f4pptwvi': {
      'en': 'Locate\nBusiness',
      'es': 'Localizar\nNegocio',
      'fr': 'Localiser\nEntreprise',
      'pt': 'Localizar\nNegócios',
    },
    'p9n2oy6r': {
      'en': 'Join\nCommunity',
      'es': 'Únete a la comunidad',
      'fr': 'Rejoignez la communauté',
      'pt': 'Junte-se à\nComunidade',
    },
    '9rxdoba1': {
      'en': 'Events',
      'es': 'Eventos',
      'fr': 'Événements',
      'pt': 'Eventos',
    },
    'i7bjyrbh': {
      'en': 'Marketplace',
      'es': 'Mercado',
      'fr': 'Marché',
      'pt': 'Mercado',
    },
    '1hquhwc7': {
      'en': 'Homes',
      'es': 'Casas',
      'fr': 'Maisons',
      'pt': 'Casas',
    },
    'senv5ih9': {
      'en': 'Dating',
      'es': 'Tener una cita',
      'fr': 'Datation',
      'pt': 'Namorando',
    },
    '7lg0oyv8': {
      'en': 'Afrotango Apps',
      'es': 'Aplicaciones de Afrotango',
      'fr': 'Applications Afrotango',
      'pt': 'Aplicativos Afrotango',
    },
    'uebaq7it': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // businessReviewPage
  {
    'jsh3fwer': {
      'en': 'Write a review',
      'es': 'Escribe una reseña',
      'fr': 'Écrire un avis',
      'pt': 'Escreva uma avaliação',
    },
    'k0dkulxu': {
      'en': 'Reviews',
      'es': 'Reseñas',
      'fr': 'Avis',
      'pt': 'Avaliações',
    },
    'up4d9saf': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // VERIFY
  {
    'ag44hwcu': {
      'en': 'Identity Verification',
      'es': 'Verificación de identidad',
      'fr': 'Vérification d\'identité',
      'pt': 'Verificação de identidade',
    },
    '6u0pgloi': {
      'en':
          'Please upload a clear photo of your ID card to verify your identity. This helps us maintain a secure platform for all users.',
      'es':
          'Por favor, suba una foto nítida de su documento de identidad para verificar su identidad. Esto nos ayuda a mantener una plataforma segura para todos los usuarios.',
      'fr':
          'Veuillez télécharger une photo claire de votre pièce d\'identité afin de vérifier votre identité. Cela nous permet de garantir la sécurité de la plateforme pour tous les utilisateurs.',
      'pt':
          'Envie uma foto nítida do seu documento de identidade para verificar sua identidade. Isso nos ajuda a manter uma plataforma segura para todos os usuários.',
    },
    'j2i7x4ig': {
      'en': 'Upload your photo',
      'es': 'Sube tu foto',
      'fr': 'Téléchargez votre photo',
      'pt': 'Carregue sua foto',
    },
    '6n589d5j': {
      'en': 'Upload a passport size picture',
      'es': 'Sube una foto tamaño pasaporte',
      'fr': 'Téléchargez une photo de format passeport',
      'pt': 'Carregue uma foto tamanho passaporte',
    },
    'y5rogvns': {
      'en': 'Tap to upload ',
      'es': 'Toque para cargar',
      'fr': 'Appuyez pour télécharger',
      'pt': 'Toque para carregar',
    },
    '3ts4mqe3': {
      'en': 'ID Card Front',
      'es': 'Frente de la tarjeta de identificación',
      'fr': 'Face avant de la carte d\'identité',
      'pt': 'Frente do cartão de identificação',
    },
    '1nb6u35n': {
      'en': 'Upload the front of your card',
      'es': 'Sube el frente de tu tarjeta',
      'fr': 'Téléchargez le recto de votre carte',
      'pt': 'Carregue a frente do seu cartão',
    },
    'or4uurwq': {
      'en': 'Tap to upload',
      'es': 'Toque para cargar',
      'fr': 'Appuyez pour télécharger',
      'pt': 'Toque para carregar',
    },
    'agma32hw': {
      'en': 'ID Card Back',
      'es': 'Parte posterior de la tarjeta de identificación',
      'fr': 'Dos de la carte d\'identité',
      'pt': 'Verso do cartão de identificação',
    },
    '9j9npxd6': {
      'en': 'Upload the back of your card',
      'es': 'Sube el reverso de tu tarjeta',
      'fr': 'Téléchargez le verso de votre carte',
      'pt': 'Carregue o verso do seu cartão',
    },
    'l892zri8': {
      'en': 'Tap to upload',
      'es': 'Toque para cargar',
      'fr': 'Appuyez pour télécharger',
      'pt': 'Toque para carregar',
    },
    'sicxd79i': {
      'en': 'Guidelines for ID Photos',
      'es': 'Pautas para fotografías de identificación',
      'fr': 'Directives pour les photos d\'identité',
      'pt': 'Diretrizes para fotos de identificação',
    },
    'z8ahxy2i': {
      'en': 'Ensure all corners of the ID are visible',
      'es':
          'Asegúrese de que todas las esquinas del documento de identidad sean visibles',
      'fr':
          'Assurez-vous que tous les coins de la pièce d\'identité sont visibles',
      'pt':
          'Certifique-se de que todos os cantos do documento de identidade estejam visíveis',
    },
    '3blb4db4': {
      'en': 'Make sure the image is clear and not blurry',
      'es': 'Asegúrese de que la imagen sea clara y no borrosa.',
      'fr': 'Assurez-vous que l\'image est claire et non floue',
      'pt': 'Certifique-se de que a imagem esteja nítida e não desfocada',
    },
    'a0cbu4gn': {
      'en': 'Avoid glare or shadows on the ID',
      'es': 'Evite reflejos o sombras en la identificación.',
      'fr': 'Évitez les reflets ou les ombres sur la carte d\'identité',
      'pt': 'Evite reflexos ou sombras no documento de identidade',
    },
    'yu1fvmz1': {
      'en': 'Information must be clearly readable',
      'es': 'La información debe ser claramente legible',
      'fr': 'Les informations doivent être clairement lisibles',
      'pt': 'As informações devem ser claramente legíveis',
    },
    'l68dxf1t': {
      'en': 'Submit for Verification',
      'es': 'Enviar para verificación',
      'fr': 'Soumettre pour vérification',
      'pt': 'Enviar para verificação',
    },
  },
  // veridetails
  {
    '67l4yqay': {
      'en': 'Verification Details',
      'es': 'Detalles de verificación',
      'fr': 'Détails de vérification',
      'pt': 'Detalhes da verificação',
    },
    'r4725air': {
      'en': 'Verification Status',
      'es': 'Estado de verificación',
      'fr': 'Statut de vérification',
      'pt': 'Status de verificação',
    },
    '9almq52y': {
      'en': 'Identity Verification',
      'es': 'Verificación de identidad',
      'fr': 'Vérification d\'identité',
      'pt': 'Verificação de identidade',
    },
    's657a3ry': {
      'en': 'Personal Information',
      'es': 'Información personal',
      'fr': 'Informations personnelles',
      'pt': 'Informações pessoais',
    },
    'kdbmn9p9': {
      'en': 'Full Name',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
      'pt': 'Nome completo',
    },
    'hnikmau5': {
      'en': 'Date of Birth',
      'es': 'Fecha de nacimiento',
      'fr': 'Date de naissance',
      'pt': 'Data de nascimento',
    },
    'i11yva7f': {
      'en': 'Verification Documents',
      'es': 'Documentos de verificación',
      'fr': 'Documents de vérification',
      'pt': 'Documentos de Verificação',
    },
    'ulg5qhck': {
      'en': 'ID Card',
      'es': 'Tarjeta de identificación',
      'fr': 'Carte d\'identité',
      'pt': 'Cartão de identificação',
    },
    '2mw8so5m': {
      'en': 'View Document',
      'es': 'Ver documento',
      'fr': 'Afficher le document',
      'pt': 'Ver documento',
    },
    'o76nmxmd': {
      'en': 'Proof of Address',
      'es': 'Comprobante de domicilio',
      'fr': 'Justificatif de domicile',
      'pt': 'Comprovante de endereço',
    },
    '0xpt977g': {
      'en': 'Uploaded on 12 May 2023',
      'es': 'Subido el 12 de mayo de 2023',
      'fr': 'Mis en ligne le 12 mai 2023',
      'pt': 'Enviado em 12 de maio de 2023',
    },
    '9demyxhc': {
      'en': 'View Document',
      'es': 'Ver documento',
      'fr': 'Afficher le document',
      'pt': 'Ver documento',
    },
    'zpowo888': {
      'en': 'Verification History',
      'es': 'Historial de verificación',
      'fr': 'Historique de vérification',
      'pt': 'Histórico de verificação',
    },
    'e6wa2xa4': {
      'en': 'Verification Completed',
      'es': 'Verificación completada',
      'fr': 'Vérification terminée',
      'pt': 'Verificação concluída',
    },
    'yd6aqtdu': {
      'en': '15 May 2023, 10:45 AM',
      'es': '15 de mayo de 2023, 10:45 a. m.',
      'fr': '15 mai 2023, 10h45',
      'pt': '15 de maio de 2023, 10h45',
    },
    '5mfxj0b9': {
      'en': 'Documents Under Review',
      'es': 'Documentos bajo revisión',
      'fr': 'Documents en cours d\'examen',
      'pt': 'Documentos em análise',
    },
    'ylnedzgs': {
      'en': '12 May 2023, 03:22 PM',
      'es': '12 de mayo de 2023, 15:22',
      'fr': '12 mai 2023, 15h22',
      'pt': '12 de maio de 2023, 15h22',
    },
    '66af4loq': {
      'en': 'Documents Uploaded',
      'es': 'Documentos cargados',
      'fr': 'Documents téléchargés',
      'pt': 'Documentos enviados',
    },
    'u8m10ugt': {
      'en': '10 May 2023, 09:15 AM',
      'es': '10 de mayo de 2023, 09:15',
      'fr': '10 mai 2023, 09h15',
      'pt': '10 de maio de 2023, 09h15',
    },
  },
  // viewID
  {
    'mct0v0a5': {
      'en': 'ID\'S',
      'es': 'Identificaciones',
      'fr': 'ID\'S',
      'pt': 'ID\'S',
    },
    'bzjyx23x': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // Manageverifyme
  {
    'sna5ties': {
      'en': 'Verification Management',
      'es': 'Gestión de verificación',
      'fr': 'Gestion de la vérification',
      'pt': 'Gestão de Verificação',
    },
    'b8i9u4ig': {
      'en': 'Verification Requests',
      'es': 'Solicitudes de verificación',
      'fr': 'Demandes de vérification',
      'pt': 'Solicitações de verificação',
    },
    'zajbuzka': {
      'en': 'Manage user verification requests',
      'es': 'Gestionar solicitudes de verificación de usuarios',
      'fr': 'Gérer les demandes de vérification des utilisateurs',
      'pt': 'Gerenciar solicitações de verificação de usuários',
    },
    'fzk5ukd7': {
      'en': 'Search by name or ID...',
      'es': 'Buscar por nombre o ID...',
      'fr': 'Rechercher par nom ou identifiant...',
      'pt': 'Pesquisar por nome ou ID...',
    },
    'ievwmv36': {
      'en': 'All',
      'es': 'Todo',
      'fr': 'Tous',
      'pt': 'Todos',
    },
    'njjfxl0u': {
      'en': 'Pending',
      'es': 'Pendiente',
      'fr': 'En attente',
      'pt': 'Pendente',
    },
    'rk92zdyz': {
      'en': 'Approved',
      'es': 'Aprobado',
      'fr': 'Approuvé',
      'pt': 'Aprovado',
    },
    '7axxbgsz': {
      'en': 'Rejected',
      'es': 'Rechazado',
      'fr': 'Rejeté',
      'pt': 'Rejeitado',
    },
    'w6bfr3ta': {
      'en': 'All',
      'es': 'Todo',
      'fr': 'Tous',
      'pt': 'Todos',
    },
    'jfnnneny': {
      'en': 'ID: VER-2023-0451',
      'es': 'Identificación: VER-2023-0451',
      'fr': 'ID : VER-2023-0451',
      'pt': 'ID: VER-2023-0451',
    },
    'ax3r2h6m': {
      'en': 'Business Verification',
      'es': 'Verificación empresarial',
      'fr': 'Vérification d\'entreprise',
      'pt': 'Verificação de negócios',
    },
    '461icr1t': {
      'en': 'Submitted',
      'es': 'Enviado',
      'fr': 'Soumis',
      'pt': 'Enviado',
    },
    '8xcdksnf': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
    's8aqs3mn': {
      'en': 'ID: VER-2023-0451',
      'es': 'Identificación: VER-2023-0451',
      'fr': 'ID : VER-2023-0451',
      'pt': 'ID: VER-2023-0451',
    },
    'chcek7n7': {
      'en': 'Business Verification',
      'es': 'Verificación empresarial',
      'fr': 'Vérification d\'entreprise',
      'pt': 'Verificação de negócios',
    },
    'al50u242': {
      'en': 'Submitted',
      'es': 'Enviado',
      'fr': 'Soumis',
      'pt': 'Enviado',
    },
    'amif3tje': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
    '0icxjy8d': {
      'en': 'ID: VER-2023-0451',
      'es': 'Identificación: VER-2023-0451',
      'fr': 'ID : VER-2023-0451',
      'pt': 'ID: VER-2023-0451',
    },
    '56z0kpdo': {
      'en': 'Business Verification',
      'es': 'Verificación empresarial',
      'fr': 'Vérification d\'entreprise',
      'pt': 'Verificação de negócios',
    },
    'hpunubn2': {
      'en': 'Submitted',
      'es': 'Enviado',
      'fr': 'Soumis',
      'pt': 'Enviado',
    },
    'lcnjly34': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
    'qh79k73h': {
      'en': 'ID: VER-2023-0451',
      'es': 'Identificación: VER-2023-0451',
      'fr': 'ID : VER-2023-0451',
      'pt': 'ID: VER-2023-0451',
    },
    'sylh0ynh': {
      'en': 'Business Verification',
      'es': 'Verificación empresarial',
      'fr': 'Vérification d\'entreprise',
      'pt': 'Verificação de negócios',
    },
    'w7e5zyi2': {
      'en': 'Submitted',
      'es': 'Enviado',
      'fr': 'Soumis',
      'pt': 'Enviado',
    },
    'mlddke1p': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
  },
  // Manageverify
  {
    'ahpseo5x': {
      'en': 'Verification Management',
      'es': 'Gestión de verificación',
      'fr': 'Gestion de la vérification',
      'pt': 'Gestão de Verificação',
    },
    '146je0nq': {
      'en': 'Verification Requests',
      'es': 'Solicitudes de verificación',
      'fr': 'Demandes de vérification',
      'pt': 'Solicitações de verificação',
    },
    '92c0ebrb': {
      'en': 'Manage user verification requests',
      'es': 'Gestionar solicitudes de verificación de usuarios',
      'fr': 'Gérer les demandes de vérification des utilisateurs',
      'pt': 'Gerenciar solicitações de verificação de usuários',
    },
    'ncqfac7r': {
      'en': 'Search by name or ID...',
      'es': 'Buscar por nombre o ID...',
      'fr': 'Rechercher par nom ou identifiant...',
      'pt': 'Pesquisar por nome ou ID...',
    },
    '5i30u506': {
      'en': 'All',
      'es': 'Todo',
      'fr': 'Tous',
      'pt': 'Todos',
    },
    'sw6oe368': {
      'en': 'Pending',
      'es': 'Pendiente',
      'fr': 'En attente',
      'pt': 'Pendente',
    },
    '4ie6mvfw': {
      'en': 'Approved',
      'es': 'Aprobado',
      'fr': 'Approuvé',
      'pt': 'Aprovado',
    },
    'ekl0surv': {
      'en': 'Rejected',
      'es': 'Rechazado',
      'fr': 'Rejeté',
      'pt': 'Rejeitado',
    },
    'f90rfbyk': {
      'en': 'All',
      'es': 'Todo',
      'fr': 'Tous',
      'pt': 'Todos',
    },
    '8jygfzjn': {
      'en': 'ID: VER-2023-0451',
      'es': 'Identificación: VER-2023-0451',
      'fr': 'ID : VER-2023-0451',
      'pt': 'ID: VER-2023-0451',
    },
    'zf9fo0ud': {
      'en': 'Business Verification',
      'es': 'Verificación empresarial',
      'fr': 'Vérification d\'entreprise',
      'pt': 'Verificação de negócios',
    },
    '3gnr1eoh': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
    'lxbmuamn': {
      'en': 'Approve',
      'es': 'Aprobar',
      'fr': 'Approuver',
      'pt': 'Aprovar',
    },
    'ca12ytbm': {
      'en': 'Reject',
      'es': 'Rechazar',
      'fr': 'Rejeter',
      'pt': 'Rejeitar',
    },
    '24lixtjc': {
      'en': 'ID: VER-2023-0451',
      'es': 'Identificación: VER-2023-0451',
      'fr': 'ID : VER-2023-0451',
      'pt': 'ID: VER-2023-0451',
    },
    '3wcqeo5o': {
      'en': 'Business Verification',
      'es': 'Verificación empresarial',
      'fr': 'Vérification d\'entreprise',
      'pt': 'Verificação de negócios',
    },
    '4ouers9u': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
    'tsmamksl': {
      'en': 'Approve',
      'es': 'Aprobar',
      'fr': 'Approuver',
      'pt': 'Aprovar',
    },
    'hk6xqe0x': {
      'en': 'Reject',
      'es': 'Rechazar',
      'fr': 'Rejeter',
      'pt': 'Rejeitar',
    },
    'rc2zr0zn': {
      'en': 'ID: VER-2023-0451',
      'es': 'Identificación: VER-2023-0451',
      'fr': 'ID : VER-2023-0451',
      'pt': 'ID: VER-2023-0451',
    },
    'frs6ck65': {
      'en': 'Business Verification',
      'es': 'Verificación empresarial',
      'fr': 'Vérification d\'entreprise',
      'pt': 'Verificação de negócios',
    },
    'oc5xq02t': {
      'en': 'Submitted',
      'es': 'Enviado',
      'fr': 'Soumis',
      'pt': 'Enviado',
    },
    '10jaar8d': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
    '46uli4xu': {
      'en': 'ID: VER-2023-0451',
      'es': 'Identificación: VER-2023-0451',
      'fr': 'ID : VER-2023-0451',
      'pt': 'ID: VER-2023-0451',
    },
    'rtzs4bp9': {
      'en': 'Business Verification',
      'es': 'Verificación empresarial',
      'fr': 'Vérification d\'entreprise',
      'pt': 'Verificação de negócios',
    },
    '87s6nof3': {
      'en': 'Submitted',
      'es': 'Enviado',
      'fr': 'Soumis',
      'pt': 'Enviado',
    },
    'uf5lkxxu': {
      'en': 'View Details',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'pt': 'Ver detalhes',
    },
  },
  // EventAttendees
  {
    'k18d8vxt': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // loginScreen
  {
    'vivmc3cr': {
      'en': 'Let’s connect you',
      'es': 'Vamos a conectarte',
      'fr': 'Connectons-vous',
      'pt': 'Vamos conectar você',
    },
    '1jwecshw': {
      'en': 'Sign into your account',
      'es': 'Inicia sesión en tu cuenta',
      'fr': 'Connectez-vous à votre compte',
      'pt': 'Entre na sua conta',
    },
    'ptd9eknm': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'pt': 'E-mail',
    },
    'shrt8ud0': {
      'en': 'Enter your email',
      'es': 'Introduce tu correo electrónico',
      'fr': 'Entrez votre email',
      'pt': 'Digite seu e-mail',
    },
    '5azxc0hw': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'pt': 'Senha',
    },
    'tzqrulw5': {
      'en': 'Enter your password',
      'es': 'Ingrese su contraseña',
      'fr': 'Entrez votre mot de passe',
      'pt': 'Digite sua senha',
    },
    'rigkhado': {
      'en': 'Log In',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'pt': 'Conecte-se',
    },
    'm7wy6n63': {
      'en': 'Forget Password',
      'es': 'Olvidé mi contraseña',
      'fr': 'Mot de passe oublié',
      'pt': 'Esqueceu a senha?',
    },
    'e4lubyhj': {
      'en': 'Don\'t have an account?',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
      'pt': 'Não tem uma conta?',
    },
    'otlwr85r': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
      'pt': 'Inscrever-se',
    },
    'bhmtmgax': {
      'en': 'Or',
      'es': 'O',
      'fr': 'Ou',
      'pt': 'Ou',
    },
    'xo4j4330': {
      'en': 'Sign in with Google',
      'es': 'Iniciar sesión con Google',
      'fr': 'Connectez-vous avec Google',
      'pt': 'Entrar com o Google',
    },
    'dqa7ojxi': {
      'en': 'This field is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '2jqohh6x': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'jf5fyhy6': {
      'en': 'This field is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    't2pmh0pm': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
    't2gb9o9f': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // signupScreen
  {
    'x3dq04ow': {
      'en': 'Welcome!',
      'es': '¡Bienvenido!',
      'fr': 'Accueillir!',
      'pt': 'Bem-vindo!',
    },
    'rdydu3oq': {
      'en': 'Create an account to get started',
      'es': 'Crea una cuenta para comenzar',
      'fr': 'Créez un compte pour commencer',
      'pt': 'Crie uma conta para começar',
    },
    '8u6esorp': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'pt': 'E-mail',
    },
    'k6dplx9e': {
      'en': 'Enter your email',
      'es': 'Introduce tu correo electrónico',
      'fr': 'Entrez votre email',
      'pt': 'Digite seu e-mail',
    },
    '3jw4eatw': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'pt': 'Senha',
    },
    '6yvolvwg': {
      'en': 'Enter your password',
      'es': 'Ingrese su contraseña',
      'fr': 'Entrez votre mot de passe',
      'pt': 'Digite sua senha',
    },
    '61cpiv10': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
      'pt': 'Inscrever-se',
    },
    'u5sventm': {
      'en': 'Already have an account?',
      'es': '¿Ya tienes una cuenta?',
      'fr': 'Vous avez déjà un compte ?',
      'pt': 'Já tem uma conta?',
    },
    'i2ypvsbl': {
      'en': 'Log In',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'pt': 'Conecte-se',
    },
    '0oi4osmw': {
      'en': 'Or',
      'es': 'O',
      'fr': 'Ou',
      'pt': 'Ou',
    },
    'wjerudm9': {
      'en': 'Sign up with Google',
      'es': 'Regístrate con Google',
      'fr': 'Inscrivez-vous avec Google',
      'pt': 'Cadastre-se com o Google',
    },
    'btqcplvs': {
      'en': 'Field is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'x2y69r3b': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'gxjhz5rh': {
      'en': 'Field is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '1agkgi1c': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'tp7lpkdb': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // Record
  {
    'izvzsrh5': {
      'en': 'Select input and output language',
      'es': 'Seleccionar el idioma de entrada y salida',
      'fr': 'Sélectionnez la langue d\'entrée et de sortie',
      'pt': 'Selecione o idioma de entrada e saída',
    },
    'gu1pqc01': {
      'en': 'Input \nLanguage',
      'es': 'Idioma de entrada',
      'fr': 'Langue de saisie',
      'pt': 'Idioma de entrada',
    },
    'yxtb0zqn': {
      'en': 'Search languages...',
      'es': 'Buscar idiomas...',
      'fr': 'Rechercher des langues...',
      'pt': 'Pesquisar idiomas...',
    },
    '377a1v7x': {
      'en': 'English',
      'es': 'Inglés',
      'fr': 'Anglais',
      'pt': 'Inglês',
    },
    'e5zzxjv2': {
      'en': 'Spanish',
      'es': 'Español',
      'fr': 'Espagnol',
      'pt': 'Espanhol',
    },
    'usszbt4r': {
      'en': 'French',
      'es': 'Francés',
      'fr': 'Français',
      'pt': 'Francês',
    },
    '7x9m637a': {
      'en': 'German',
      'es': 'Alemán',
      'fr': 'Allemand',
      'pt': 'Alemão',
    },
    'gekzgebe': {
      'en': 'Chinese',
      'es': 'Chino',
      'fr': 'Chinois',
      'pt': 'chinês',
    },
    'as236wau': {
      'en': 'Afrikaans',
      'es': 'africaans',
      'fr': 'afrikaans',
      'pt': 'afrikaans',
    },
    'xq19e4wo': {
      'en': 'Arabic',
      'es': 'árabe',
      'fr': 'arabe',
      'pt': 'árabe',
    },
    '8rg0g17m': {
      'en': 'Armenian',
      'es': 'armenio',
      'fr': 'arménien',
      'pt': 'armênio',
    },
    '8hwlrsix': {
      'en': 'Azerbaijani',
      'es': 'azerbaiyano',
      'fr': 'azerbaïdjanais',
      'pt': 'azerbaijano',
    },
    'eq3ar1j7': {
      'en': 'Belarusian',
      'es': 'bielorruso',
      'fr': 'biélorusse',
      'pt': 'Bielorrusso',
    },
    'pnvmy32j': {
      'en': 'Output Language',
      'es': 'Idioma de salida',
      'fr': 'Langue de sortie',
      'pt': 'Idioma de saída',
    },
    'bg7zdm07': {
      'en': 'Search languages...',
      'es': 'Buscar idiomas...',
      'fr': 'Rechercher des langues...',
      'pt': 'Pesquisar idiomas...',
    },
    'unhkkguv': {
      'en': 'Spanish',
      'es': 'Español',
      'fr': 'Espagnol',
      'pt': 'Espanhol',
    },
    'l4okylpc': {
      'en': 'English',
      'es': 'Inglés',
      'fr': 'Anglais',
      'pt': 'Inglês',
    },
    't0puyixu': {
      'en': 'French',
      'es': 'Francés',
      'fr': 'Français',
      'pt': 'Francês',
    },
    'ke1ckodw': {
      'en': 'German',
      'es': 'Alemán',
      'fr': 'Allemand',
      'pt': 'Alemão',
    },
    'lupa9vld': {
      'en': 'Japanese',
      'es': 'japonés',
      'fr': 'japonais',
      'pt': 'japonês',
    },
    'gwfi74p1': {
      'en': 'Tap to Record',
      'es': 'Toque para grabar',
      'fr': 'Appuyez pour enregistrer',
      'pt': 'Toque para gravar',
    },
    'l0hqeeyf': {
      'en': 'Recording... Tap to Stop',
      'es': 'Grabando... Toque para detener',
      'fr': 'Enregistrement... Appuyez pour arrêter',
      'pt': 'Gravando... Toque para parar',
    },
    '6vmg1aet': {
      'en': 'Original Audio',
      'es': 'Audio original',
      'fr': 'Audio original',
      'pt': 'Áudio original',
    },
    '9a0b1jk8': {
      'en': 'Translated Audio',
      'es': 'Audio traducido',
      'fr': 'Audio traduit',
      'pt': 'Áudio traduzido',
    },
    'sik7eed6': {
      'en': '00:35',
      'es': '00:35',
      'fr': '00:35',
      'pt': '00:35',
    },
    'z2g0pkis': {
      'en': 'Transcription',
      'es': 'Transcripción',
      'fr': 'Transcription',
      'pt': 'Transcrição',
    },
    'piu6vax7': {
      'en': 'Voice Translator',
      'es': 'Traductor de voz',
      'fr': 'Traducteur vocal',
      'pt': 'Tradutor de voz',
    },
  },
  // signupPage_old
  {
    'fpvqp3gv': {
      'en': 'Welcome!',
      'es': '¡Bienvenido!',
      'fr': 'Accueillir!',
      'pt': 'Bem-vindo!',
    },
    '9o09xg77': {
      'en': 'Create an account to get started',
      'es': 'Crea una cuenta para comenzar',
      'fr': 'Créez un compte pour commencer',
      'pt': 'Crie uma conta para começar',
    },
    'zoitusnp': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'pt': 'E-mail',
    },
    'rg9zlf8f': {
      'en': 'enter your email',
      'es': 'Ingrese su correo electrónico',
      'fr': 'entrez votre email',
      'pt': 'digite seu e-mail',
    },
    'q5p9hwhi': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'pt': 'Senha',
    },
    '6pu5s1mr': {
      'en': 'enter your password',
      'es': 'Ingrese su contraseña',
      'fr': 'entrez votre mot de passe',
      'pt': 'digite sua senha',
    },
    'l0e1v1fi': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
      'pt': 'Inscrever-se',
    },
    '7cb6eou1': {
      'en': 'Already have an account?',
      'es': '¿Ya tienes una cuenta?',
      'fr': 'Vous avez déjà un compte ?',
      'pt': 'Já tem uma conta?',
    },
    '4w9vzbu0': {
      'en': 'Log In',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'pt': 'Conecte-se',
    },
    'qcr67hfw': {
      'en': 'Or',
      'es': 'O',
      'fr': 'Ou',
      'pt': 'Ou',
    },
    '968x3uc7': {
      'en': 'Sign up with Google',
      'es': 'Regístrate con Google',
      'fr': 'Inscrivez-vous avec Google',
      'pt': 'Cadastre-se com o Google',
    },
    '4ux9o6mr': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'pt': 'Campo obrigatório',
    },
    'i38s2fpp': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'pt': 'Por favor, escolha uma opção no menu suspenso',
    },
    'iqo1n0o1': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'pt': 'Campo obrigatório',
    },
    'mcubkcxm': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'pt': 'Por favor, escolha uma opção no menu suspenso',
    },
    'oubywqbo': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // homePage
  {
    'mdmavcb3': {
      'en': 'Let\'s get connected',
      'es': 'Vamos a conectarnos',
      'fr': 'Connectons-nous',
      'pt': 'Vamos nos conectar',
    },
    'vz7wo5xy': {
      'en': 'What are you looking for?',
      'es': '¿Qué estás buscando?',
      'fr': 'Qu\'est-ce que tu cherches?',
      'pt': 'O que você está procurando?',
    },
    'adpu0z6e': {
      'en': 'Quick Access',
      'es': 'Acceso rápido',
      'fr': 'Accès rapide',
      'pt': 'Acesso rápido',
    },
    '2f58vmhe': {
      'en': 'View More',
      'es': 'Ver más',
      'fr': 'Voir plus',
      'pt': 'Ver mais',
    },
    'd5900tpn': {
      'en': 'Find \nPeople',
      'es': 'Encontrar\npersonas',
      'fr': 'Trouver des personnes',
      'pt': 'Encontrar\nPessoas',
    },
    '0wijya8i': {
      'en': 'Locate\nBusiness',
      'es': 'Localizar\nNegocio',
      'fr': 'Localiser\nEntreprise',
      'pt': 'Localizar\nNegócios',
    },
    'f10em692': {
      'en': 'Join\nCommunity',
      'es': 'Únete a la comunidad',
      'fr': 'Rejoignez la communauté',
      'pt': 'Junte-se à\nComunidade',
    },
    'tf0c01w2': {
      'en': 'Events',
      'es': 'Eventos',
      'fr': 'Événements',
      'pt': 'Eventos',
    },
    'f6ytmarq': {
      'en': 'Marketplace',
      'es': 'Mercado',
      'fr': 'Marché',
      'pt': 'Mercado',
    },
    'ln5esg6l': {
      'en': 'Homes',
      'es': 'Casas',
      'fr': 'Maisons',
      'pt': 'Casas',
    },
    'kyhfbohc': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // myPost
  {
    'pd1g1g8v': {
      'en': 'My Post',
      'es': 'Mi publicación',
      'fr': 'Mon message',
      'pt': 'Minha postagem',
    },
    'sbl5s0kt': {
      'en': 'My Businesses',
      'es': 'Mis negocios',
      'fr': 'Mes entreprises',
      'pt': 'Meus Negócios',
    },
    '940la8oq': {
      'en': 'My Groups',
      'es': 'Mis grupos',
      'fr': 'Mes groupes',
      'pt': 'Meus Grupos',
    },
    'mryyc41e': {
      'en': 'My Products',
      'es': 'Mis productos',
      'fr': 'Mes produits',
      'pt': 'Meus Produtos',
    },
    '0l9mbd8v': {
      'en': 'Created Events',
      'es': 'Eventos creados',
      'fr': 'Événements créés',
      'pt': 'Eventos criados',
    },
  },
  // searchFilter
  {
    'srkulkeo': {
      'en': 'search people',
      'es': 'buscar personas',
      'fr': 'rechercher des personnes',
      'pt': 'pesquisar pessoas',
    },
    'wf6xabxl': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // busineslistCopy
  {
    'x3u33afs': {
      'en': 'Business Directory',
      'es': 'Directorio de empresas',
      'fr': 'Annuaire des entreprises',
      'pt': 'Diretório de Empresas',
    },
    '6xrq2nvq': {
      'en': 'Search businesses...',
      'es': 'Buscar negocios...',
      'fr': 'Rechercher des entreprises...',
      'pt': 'Pesquisar empresas...',
    },
    '2n35rfwt': {
      'en': 'Directions',
      'es': 'Instrucciones',
      'fr': 'Instructions',
      'pt': 'Instruções',
    },
    'clvepub3': {
      'en': 'Call',
      'es': 'Llamar',
      'fr': 'Appel',
      'pt': 'Chamar',
    },
    'a3j0nwqa': {
      'en': 'Website',
      'es': 'Sitio web',
      'fr': 'Site web',
      'pt': 'Site',
    },
    'no9eja11': {
      'en': 'Directions',
      'es': 'Instrucciones',
      'fr': 'Instructions',
      'pt': 'Instruções',
    },
    '2ja46dp3': {
      'en': 'Call',
      'es': 'Llamar',
      'fr': 'Appel',
      'pt': 'Chamar',
    },
    'kqu2xrvu': {
      'en': 'Website',
      'es': 'Sitio web',
      'fr': 'Site web',
      'pt': 'Site',
    },
  },
  // comunityHomeCopy
  {
    '4jktjlf3': {
      'en': 'Communities',
      'es': 'Comunidades',
      'fr': 'Communautés',
      'pt': 'Comunidades',
    },
    'l40ehyto': {
      'en': 'View all',
      'es': 'Ver todo',
      'fr': 'Tout voir',
      'pt': 'Ver tudo',
    },
    'otszfess': {
      'en': 'New Chat',
      'es': 'Nuevo chat',
      'fr': 'Nouveau chat',
      'pt': 'Novo bate-papo',
    },
    'ioa5d23a': {
      'en': 'Create Group',
      'es': 'Crear grupo',
      'fr': 'Créer un groupe',
      'pt': 'Criar grupo',
    },
    'lgmd1sjg': {
      'en': 'Search Group/Community',
      'es': 'Buscar grupo/comunidad',
      'fr': 'Groupe/Communauté de recherche',
      'pt': 'Grupo/Comunidade de Pesquisa',
    },
    '88hr1nyy': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // businessSearch
  {
    'postsxx1': {
      'en': 'Country',
      'es': 'País',
      'fr': 'Pays',
      'pt': 'País',
    },
    'llg6ck5e': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
      'pt': 'Procurar...',
    },
    '9qth6b8b': {
      'en': 'Search Results',
      'es': 'Resultados de la búsqueda',
      'fr': 'Résultats de la recherche',
      'pt': 'Resultados da pesquisa',
    },
    's3xipzmh': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // businessSearchFilter
  {
    '5ajqppc4': {
      'en': 'Search Business',
      'es': 'Buscar negocios',
      'fr': 'Rechercher une entreprise',
      'pt': 'Pesquisar Negócios',
    },
    's03s63hi': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // communitySearchResult
  {
    'cclzpwa0': {
      'en': 'Country',
      'es': 'País',
      'fr': 'Pays',
      'pt': 'País',
    },
    'hhdi62p2': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
      'pt': 'Procurar...',
    },
    'u4uvfbk5': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // searchFilterComunty
  {
    'dzmcml3a': {
      'en': 'search community',
      'es': 'comunidad de búsqueda',
      'fr': 'communauté de recherche',
      'pt': 'comunidade de pesquisa',
    },
    'lfv9fyl4': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // busineslist
  {
    'lp7di38v': {
      'en': 'Create Business',
      'es': 'Crear negocio',
      'fr': 'Créer une entreprise',
      'pt': 'Criar Negócios',
    },
    'hfn6gf9t': {
      'en': 'My Business',
      'es': 'Mi negocio',
      'fr': 'Mon entreprise',
      'pt': 'Meu Negócio',
    },
    '3uwwe4l2': {
      'en': 'Featured Businesses',
      'es': 'Empresas destacadas',
      'fr': 'Entreprises en vedette',
      'pt': 'Empresas em Destaque',
    },
    'cy2ivz8b': {
      'en': 'Popular Businesses',
      'es': 'Negocios populares',
      'fr': 'Entreprises populaires',
      'pt': 'Negócios populares',
    },
    'rznw0h8a': {
      'en': 'New Businesses',
      'es': 'Nuevos negocios',
      'fr': 'Nouvelles entreprises',
      'pt': 'Novos Negócios',
    },
    '10kdtc4n': {
      'en': 'Business Directory',
      'es': 'Directorio de empresas',
      'fr': 'Annuaire des entreprises',
      'pt': 'Diretório de Empresas',
    },
    'nwp4g506': {
      'en': 'search business',
      'es': 'negocio de búsqueda',
      'fr': 'recherche d\'entreprise',
      'pt': 'pesquisar negócios',
    },
  },
  // searchResultsAll
  {
    'p2fi5m1n': {
      'en': 'Search people',
      'es': 'Buscar personas',
      'fr': 'Rechercher des personnes',
      'pt': 'Pesquisar pessoas',
    },
    '4i5wnisr': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // searchcontactCopy
  {
    '74ofgfi8': {
      'en': 'Search something',
      'es': 'Buscar algo',
      'fr': 'Rechercher quelque chose',
      'pt': 'Pesquisar algo',
    },
    '5rvtnazn': {
      'en': 'Professionals',
      'es': 'Profesionales',
      'fr': 'Professionnels',
      'pt': 'Profissionais',
    },
    'wwxpf5g8': {
      'en': 'Entrepreneurs',
      'es': 'Emprendedores',
      'fr': 'Entrepreneurs',
      'pt': 'Empreendedores',
    },
    'edaf2n2r': {
      'en': 'Students',
      'es': 'Estudiantes',
      'fr': 'Étudiants',
      'pt': 'Estudantes',
    },
    've50k5hb': {
      'en': 'Athletes',
      'es': 'Atletas',
      'fr': 'Athlètes',
      'pt': 'Atletas',
    },
    '7znvp4tg': {
      'en': 'Artisans',
      'es': 'artesanos',
      'fr': 'Artisans',
      'pt': 'Artesãos',
    },
    'navqycl6': {
      'en': 'Recent Search',
      'es': 'Búsqueda reciente',
      'fr': 'Recherche récente',
      'pt': 'Pesquisa recente',
    },
    'g2zh07ji': {
      'en': 'System check',
      'es': 'Comprobación del sistema',
      'fr': 'Vérification du système',
      'pt': 'Verificação do sistema',
    },
    '4mbm5wbi': {
      'en': 'System check',
      'es': 'Comprobación del sistema',
      'fr': 'Vérification du système',
      'pt': 'Verificação do sistema',
    },
    '9kq2vbig': {
      'en': 'System check',
      'es': 'Comprobación del sistema',
      'fr': 'Vérification du système',
      'pt': 'Verificação do sistema',
    },
    'y6lcgm2g': {
      'en': 'Search result',
      'es': 'Resultado de la búsqueda',
      'fr': 'Résultat de la recherche',
      'pt': 'Resultado da pesquisa',
    },
    'txorvyjq': {
      'en': 'Featured users',
      'es': 'Usuarios destacados',
      'fr': 'Utilisateurs en vedette',
      'pt': 'Usuários em destaque',
    },
    'l9uq2rjy': {
      'en': 'Popular Users',
      'es': 'Usuarios populares',
      'fr': 'Utilisateurs populaires',
      'pt': 'Usuários populares',
    },
    '16lelda0': {
      'en': 'New Users',
      'es': 'Nuevos usuarios',
      'fr': 'Nouveaux utilisateurs',
      'pt': 'Novos usuários',
    },
    'v30tiuab': {
      'en': 'Search people',
      'es': 'Buscar personas',
      'fr': 'Rechercher des personnes',
      'pt': 'Pesquisar pessoas',
    },
    'xw0jinxy': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // PopularUsers
  {
    'o105ev8f': {
      'en': 'Popular Users',
      'es': 'Eventos reservados',
      'fr': 'Événements réservés',
      'pt': 'Eventos Reservados',
    },
    'f46oo1ws': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // FeaturedUsers
  {
    'hpufo7jq': {
      'en': 'Featured Users',
      'es': 'Eventos reservados',
      'fr': 'Événements réservés',
      'pt': 'Eventos Reservados',
    },
    'nrnr2ls7': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // NewUsers
  {
    'eny198zj': {
      'en': 'New Users',
      'es': 'Eventos reservados',
      'fr': 'Événements réservés',
      'pt': 'Eventos Reservados',
    },
    'uoasnsgu': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // profileshareCopy
  {
    '9zgmh205': {
      'en': 'Profile QR Code',
      'es': 'Código QR del perfil',
      'fr': 'Code QR du profil',
      'pt': 'Código QR do perfil',
    },
    'xazbstla': {
      'en': 'Share your profile',
      'es': 'Comparte tu perfil',
      'fr': 'Partagez votre profil',
      'pt': 'Compartilhe seu perfil',
    },
    'ox8x8w1j': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
  },
  // eventCreate
  {
    'r730pz2j': {
      'en': 'Create Event',
      'es': 'Crear evento',
      'fr': 'Créer un événement',
      'pt': 'Criar evento',
    },
    'slris273': {
      'en': 'Drop your event image here or browse',
      'es': 'Deja aquí la imagen de tu evento o navega',
      'fr': 'Déposez l\'image de votre événement ici ou parcourez',
      'pt': 'Solte a imagem do seu evento aqui ou navegue',
    },
    'nnzi8bat': {
      'en': 'Event Name',
      'es': 'Nombre del evento',
      'fr': 'Nom de l\'événement',
      'pt': 'Nome do evento',
    },
    'zn6h9za6': {
      'en': 'Event Name',
      'es': 'Nombre del evento',
      'fr': 'Nom de l\'événement',
      'pt': 'Nome do evento',
    },
    'qbam12rh': {
      'en': 'Select Category',
      'es': 'Seleccionar categoría',
      'fr': 'Sélectionnez une catégorie',
      'pt': 'Selecione a categoria',
    },
    '4c4uxust': {
      'en': 'Select Category',
      'es': 'Seleccionar categoría',
      'fr': 'Sélectionnez une catégorie',
      'pt': 'Selecione a categoria',
    },
    'fteyg893': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
      'pt': 'Procurar...',
    },
    'og6dwfj5': {
      'en': 'Sports',
      'es': 'Deportes',
      'fr': 'Sportif',
      'pt': 'Esportes',
    },
    'h9i7xvf0': {
      'en': 'Cooking',
      'es': 'Cocinando',
      'fr': 'Cuisson',
      'pt': 'Culinária',
    },
    '5cbg68d3': {
      'en': 'Business',
      'es': 'Negocio',
      'fr': 'Entreprise',
      'pt': 'Negócios',
    },
    'aup121iz': {
      'en': 'Party',
      'es': 'Fiesta',
      'fr': 'Faire la fête',
      'pt': 'Festa',
    },
    '8y5p0ruh': {
      'en': 'Event Country',
      'es': 'País del evento',
      'fr': 'Pays de l\'événement',
      'pt': 'País do evento',
    },
    'cb35nev8': {
      'en': 'Select Country',
      'es': 'Seleccionar país',
      'fr': 'Sélectionnez un pays',
      'pt': 'Selecione o país',
    },
    'vhrvlryy': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
      'pt': 'Procurar...',
    },
    'hqop92ok': {
      'en': 'Event  Start Date',
      'es': 'Fecha de inicio del evento',
      'fr': 'Date de début de l\'événement',
      'pt': 'Data de início do evento',
    },
    '44s6z39c': {
      'en': 'Event  End Date',
      'es': 'Fecha de finalización del evento',
      'fr': 'Date de fin de l\'événement',
      'pt': 'Data de término do evento',
    },
    '5e7jk77s': {
      'en': 'Is this is paid event?',
      'es': 'Pagado',
      'fr': 'Payé',
      'pt': 'Pago',
    },
    '0jcvj1nv': {
      'en': 'Toggle if Yes!',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '7edxs2pj': {
      'en': 'Price',
      'es': 'Precio',
      'fr': 'Prix',
      'pt': 'Preço',
    },
    't5v5my1t': {
      'en': 'Event  Location',
      'es': 'Ubicación del evento',
      'fr': 'Lieu de l\'événement',
      'pt': 'Local do evento',
    },
    'zuovemgg': {
      'en': 'Location',
      'es': 'Ubicación',
      'fr': 'Emplacement',
      'pt': 'Localização',
    },
    'n0nnyrcw': {
      'en': 'Description',
      'es': 'Descripción',
      'fr': 'Description',
      'pt': 'Descrição',
    },
    '28b98yk7': {
      'en': 'Event description',
      'es': 'Descripción del evento',
      'fr': 'Description de l\'événement',
      'pt': 'Descrição do evento',
    },
    '2x153f42': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'pt': 'Cancelar',
    },
    '1d4m6lnk': {
      'en': 'Create',
      'es': 'Crear',
      'fr': 'Créer',
      'pt': 'Criar',
    },
    'gzo4x0jn': {
      'en': 'Event Name is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'unba9u5f': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '9tk4q464': {
      'en': 'Price is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'vd762u5g': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'ghbeykap': {
      'en': 'Location is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'j35q7ahf': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '1br2av3l': {
      'en': 'Event description is required',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '1u8jcn6i': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
      'pt': '',
    },
  },
  // card1
  {
    '4zjm5zli': {
      'en': 'Free',
      'es': 'Gratis',
      'fr': 'Gratuit',
      'pt': 'Livre',
    },
  },
  // card2
  {
    'wv98oa0h': {
      'en': '•',
      'es': '•',
      'fr': '•',
      'pt': '•',
    },
    'kjj9nzov': {
      'en': 'View',
      'es': 'Vista',
      'fr': 'Voir',
      'pt': 'Visualizar',
    },
    'am07jx89': {
      'en': 'Free',
      'es': 'Gratis',
      'fr': 'Gratuit',
      'pt': 'Livre',
    },
  },
  // card3
  {
    'mer48cj8': {
      'en': ',',
      'es': ',',
      'fr': ',',
      'pt': ',',
    },
  },
  // eventNavebar
  {
    'u6l8vlv6': {
      'en': 'Events',
      'es': 'Eventos',
      'fr': 'Événements',
      'pt': 'Eventos',
    },
    'fqm7gfyf': {
      'en': 'Create Event',
      'es': 'Crear evento',
      'fr': 'Créer un événement',
      'pt': 'Criar evento',
    },
    '5c5bu033': {
      'en': 'Booked Events',
      'es': 'Eventos reservados',
      'fr': 'Événements réservés',
      'pt': 'Eventos Reservados',
    },
    'k122nil3': {
      'en': 'My Events',
      'es': 'Mis eventos',
      'fr': 'Mes événements',
      'pt': 'Meus Eventos',
    },
  },
  // cardselected
  {
    'xgt30446': {
      'en': 'Zara',
      'es': 'Zara',
      'fr': 'Zara',
      'pt': 'Zara',
    },
    'rtngtqh7': {
      'en': 'Wool Blend Midi Skirt',
      'es': 'Falda midi de mezcla de lana',
      'fr': 'Jupe midi en laine mélangée',
      'pt': 'Saia midi de mistura de lã',
    },
    '2rlversy': {
      'en': '\$99',
      'es': '\$99',
      'fr': '99 \$',
      'pt': '\$ 99',
    },
  },
  // emptymarket
  {
    'yfqbtfbb': {
      'en': 'No Items Selected',
      'es': 'No hay artículos seleccionados',
      'fr': 'Aucun élément sélectionné',
      'pt': 'Nenhum item selecionado',
    },
    'k8n2sb79': {
      'en': 'Let\'s go shopping now!',
      'es': '¡Vamos de compras ahora!',
      'fr': 'Allons faire du shopping maintenant !',
      'pt': 'Vamos às compras agora!',
    },
  },
  // cardfood
  {
    'uqzkeibj': {
      'en': 'GET',
      'es': 'CONSEGUIR',
      'fr': 'OBTENIR',
      'pt': 'PEGAR',
    },
    '0cym4l31': {
      'en': '10% OFF',
      'es': '10% de descuento',
      'fr': '10% de réduction',
      'pt': '10% DE DESCONTO',
    },
    'lm3t2aj4': {
      'en': 'Use code:',
      'es': 'Utilice el código:',
      'fr': 'Utiliser le code :',
      'pt': 'Use o código:',
    },
    'w1h4747p': {
      'en': 'WELCOMEBACK',
      'es': 'BIENVENIDO DE NUEVO',
      'fr': 'CONTENT DE TE REVOIR',
      'pt': 'BEM VINDO DE VOLTA',
    },
    'davz0dd8': {
      'en': 'ORDER NOW',
      'es': 'ORDENAR AHORA',
      'fr': 'COMMANDEZ MAINTENANT',
      'pt': 'ENCOMENDE AGORA',
    },
  },
  // cardfoodrecomend
  {
    'i36gv1nj': {
      'en': 'Plain Dosa - 2 nos',
      'es': 'Dosa simple - 2 unidades',
      'fr': 'Dosa nature - 2 pièces',
      'pt': 'Dosa Simples - 2 doses',
    },
    '4qccwd2b': {
      'en': '₹ 180',
      'es': '₹ 180',
      'fr': '₹ 180',
      'pt': '₹ 180',
    },
    'ly8ddw3h': {
      'en': '320 kcal',
      'es': '320 kcal',
      'fr': '320 kcal',
      'pt': '320 kcal',
    },
    'blr5kxpe': {
      'en': '300 gm',
      'es': '300 gramos',
      'fr': '300 g',
      'pt': '300 gramas',
    },
  },
  // emptyoderevent
  {
    'wljppt0b': {
      'en': 'Your Order',
      'es': 'Su pedido',
      'fr': 'Votre commande',
      'pt': 'Seu pedido',
    },
    '4lnywzi5': {
      'en': 'There are no\nupcoming tickets yet',
      'es': 'Todavía no hay entradas disponibles',
      'fr': 'Il n\'y a pas encore de billets à venir.',
      'pt': 'Ainda não há\ningressos disponíveis',
    },
    'kioy2m07': {
      'en': 'Don\'t miss the chance to catch\nyour favorite show',
      'es': 'No te pierdas la oportunidad de ver tu programa favorito.',
      'fr': 'Ne manquez pas l\'occasion de regarder\nvotre émission préférée',
      'pt': 'Não perca a chance de assistir\nao seu programa favorito',
    },
    'wsgp6v65': {
      'en': 'Get your tickets now!',
      'es': '¡Consigue tus entradas ahora!',
      'fr': 'Achetez vos billets maintenant !',
      'pt': 'Compre já o seu ingresso!',
    },
  },
  // card1C
  {
    '6jk5m21o': {
      'en': 'Rebooking',
      'es': 'Cambio de reserva',
      'fr': 'Changement de réservation',
      'pt': 'Remarcação',
    },
  },
  // comunityNav
  {
    'f1toqo0f': {
      'en': 'Create Group',
      'es': 'Agregar grupo',
      'fr': 'Ajouter un groupe',
      'pt': 'Adicionar grupo',
    },
    'kfu8o9ks': {
      'en': 'My Groups',
      'es': 'Mis grupos',
      'fr': 'Mes groupes',
      'pt': 'Meus Grupos',
    },
    'ntj4li5j': {
      'en': 'Group Chat',
      'es': 'Chats',
      'fr': 'Chats',
      'pt': 'Bate-papos',
    },
  },
  // updateddress
  {
    'om1gl0qm': {
      'en': 'Update Address',
      'es': 'Actualizar dirección',
      'fr': 'Mettre à jour l\'adresse',
      'pt': 'Atualizar endereço',
    },
    'knovwyta': {
      'en': 'Street Address',
      'es': 'Dirección de la calle',
      'fr': 'Adresse de la rue',
      'pt': 'Endereço da Rua',
    },
    'rsam2qgl': {
      'en': '123 Main St',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '5komra1q': {
      'en': 'City',
      'es': 'Ciudad',
      'fr': 'Ville',
      'pt': 'Cidade',
    },
    'st5ibsmi': {
      'en': 'Los Angeles',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '7nyeo0se': {
      'en': 'State',
      'es': 'Estado',
      'fr': 'État',
      'pt': 'Estado',
    },
    'h8fcf85m': {
      'en': 'California',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'uz2ghpx0': {
      'en': 'Zip Code',
      'es': 'Código postal',
      'fr': 'Code postal',
      'pt': 'CEP',
    },
    '26fxmxvg': {
      'en': '12345',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '3k373g7x': {
      'en': 'Country',
      'es': 'País',
      'fr': 'Pays',
      'pt': 'País',
    },
    '0wdgv4cl': {
      'en': 'USA',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'tiyv93tp': {
      'en': 'Update Address',
      'es': 'Actualizar dirección',
      'fr': 'Mettre à jour l\'adresse',
      'pt': 'Atualizar endereço',
    },
  },
  // ratingrcipe
  {
    'e41efxji': {
      'en': 'Rate This Recipe',
      'es': 'Califica esta receta',
      'fr': 'Notez cette recette',
      'pt': 'Avalie esta receita',
    },
    'pquarz2q': {
      'en': 'How would you rate this recipe?',
      'es': '¿Cómo calificarías esta receta?',
      'fr': 'Comment évalueriez-vous cette recette ?',
      'pt': 'Como você avaliaria esta receita?',
    },
    'sveu7f67': {
      'en': 'Share your thoughts (optional)',
      'es': 'Comparte tus pensamientos (opcional)',
      'fr': 'Partagez vos pensées (facultatif)',
      'pt': 'Compartilhe seus pensamentos (opcional)',
    },
    'mfvf346a': {
      'en': 'Submit Review',
      'es': 'Enviar reseña',
      'fr': 'Soumettre un avis',
      'pt': 'Enviar avaliação',
    },
  },
  // createproduct
  {
    'k0oy9817': {
      'en': 'Create New Product',
      'es': 'Crear nuevo producto',
      'fr': 'Créer un nouveau produit',
      'pt': 'Criar novo produto',
    },
    'zkipgh90': {
      'en': 'Product Name',
      'es': 'Nombre del producto',
      'fr': 'Nom du produit',
      'pt': 'Nome do produto',
    },
    'yhzl89tt': {
      'en': 'Enter product name',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'vmqy3c6t': {
      'en': 'Price',
      'es': 'Precio',
      'fr': 'Prix',
      'pt': 'Preço',
    },
    '0oo8bbqe': {
      'en': 'Enter price',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'tyklcrpi': {
      'en': 'Description',
      'es': 'Descripción',
      'fr': 'Description',
      'pt': 'Descrição',
    },
    'wshcs17p': {
      'en': 'Enter product description',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '85vjviis': {
      'en': 'Color',
      'es': 'Color',
      'fr': 'Couleur',
      'pt': 'Cor',
    },
    'z4fna2bf': {
      'en': 'white',
      'es': 'blanco',
      'fr': 'blanc',
      'pt': 'branco',
    },
    '9lmac6no': {
      'en': 'blue',
      'es': 'azul',
      'fr': 'bleu',
      'pt': 'azul',
    },
    '8dfimad7': {
      'en': 'Red',
      'es': 'Rojo',
      'fr': 'Rouge',
      'pt': 'Vermelho',
    },
    '18ay1cwa': {
      'en': 'Yellow',
      'es': 'Amarillo',
      'fr': 'Jaune',
      'pt': 'Amarelo',
    },
    'vxo9vzqe': {
      'en': 'Green',
      'es': 'Verde',
      'fr': 'Vert',
      'pt': 'Verde',
    },
    'e7yendy0': {
      'en': 'Black',
      'es': 'Negro',
      'fr': 'Noir',
      'pt': 'Preto',
    },
    'dhlkpz16': {
      'en': 'white',
      'es': 'blanco',
      'fr': 'blanc',
      'pt': 'branco',
    },
    '8scaesc9': {
      'en': 'Size',
      'es': 'Tamaño',
      'fr': 'Taille',
      'pt': 'Tamanho',
    },
    '2xda2hjx': {
      'en': 'xxs',
      'es': 'xxs',
      'fr': 'xxs',
      'pt': 'xxs',
    },
    'qv568f0f': {
      'en': 'xs',
      'es': 'xs',
      'fr': 'xs',
      'pt': 'xs',
    },
    'e3dmpxt6': {
      'en': 'X',
      'es': 'incógnita',
      'fr': 'X',
      'pt': 'X',
    },
    'ahklyr8q': {
      'en': 'M',
      'es': 'METRO',
      'fr': 'M',
      'pt': 'M',
    },
    'xq9ijrhp': {
      'en': 'L',
      'es': 'Yo',
      'fr': 'L',
      'pt': 'eu',
    },
    'sd0xqp7h': {
      'en': 'XL',
      'es': 'SG',
      'fr': 'XL',
      'pt': 'GG',
    },
    '5yqr5wuz': {
      'en': 'XXL',
      'es': 'XXL',
      'fr': 'XXL',
      'pt': 'XXG',
    },
    'hawrpdxm': {
      'en': 'XXL',
      'es': 'XXL',
      'fr': 'XXL',
      'pt': 'XXG',
    },
    'dqzxdxgt': {
      'en': 'Category',
      'es': 'Categoría',
      'fr': 'Catégorie',
      'pt': 'Categoria',
    },
    'img6zsyp': {
      'en': 'Electronics',
      'es': 'Electrónica',
      'fr': 'Électronique',
      'pt': 'Eletrônica',
    },
    'sosmwzed': {
      'en': 'Clothing',
      'es': 'Ropa',
      'fr': 'Vêtements',
      'pt': 'Roupas',
    },
    'busodlsh': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
    'qs4fhqbe': {
      'en': 'Beauty',
      'es': 'Belleza',
      'fr': 'Beauté',
      'pt': 'Beleza',
    },
    '1nabl3e8': {
      'en': 'Food',
      'es': 'Alimento',
      'fr': 'Nourriture',
      'pt': 'Comida',
    },
    '81nkmt3x': {
      'en': 'Other',
      'es': 'Otro',
      'fr': 'Autre',
      'pt': 'Outro',
    },
    'xa65eei7': {
      'en': 'Product Image',
      'es': 'Imagen del producto',
      'fr': 'Image du produit',
      'pt': 'Imagem do produto',
    },
    'kojpm9wc': {
      'en': 'Tap to upload image',
      'es': 'Toque para cargar la imagen',
      'fr': 'Appuyez pour télécharger l\'image',
      'pt': 'Toque para carregar a imagem',
    },
    'fi29qasr': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'pt': 'Cancelar',
    },
    '8gkctyhs': {
      'en': 'Create Product',
      'es': 'Crear producto',
      'fr': 'Créer un produit',
      'pt': 'Criar produto',
    },
  },
  // createrecipe
  {
    '0yfkydrp': {
      'en': 'Create Recipe',
      'es': 'Crear receta',
      'fr': 'Créer une recette',
      'pt': 'Criar receita',
    },
    'gk19t411': {
      'en': 'Add Recipe Photo',
      'es': 'Agregar foto de la receta',
      'fr': 'Ajouter une photo de recette',
      'pt': 'Adicionar foto da receita',
    },
    'vh64pa6f': {
      'en': 'Recipe Details',
      'es': 'Detalles de la receta',
      'fr': 'Détails de la recette',
      'pt': 'Detalhes da receita',
    },
    'mzywtkuj': {
      'en': 'Recipe Name',
      'es': 'Nombre de la receta',
      'fr': 'Nom de la recette',
      'pt': 'Nome da receita',
    },
    'gt3i83jh': {
      'en': 'Enter recipe name...',
      'es': 'Introduzca el nombre de la receta...',
      'fr': 'Entrez le nom de la recette...',
      'pt': 'Digite o nome da receita...',
    },
    '9uucyqt2': {
      'en': 'Description',
      'es': 'Descripción',
      'fr': 'Description',
      'pt': 'Descrição',
    },
    'uc6h008o': {
      'en': 'Describe your recipe...',
      'es': 'Describe tu receta...',
      'fr': 'Décrivez votre recette...',
      'pt': 'Descreva sua receita...',
    },
    '8p1bkej5': {
      'en': 'nutrition',
      'es': 'nutrición',
      'fr': 'nutrition',
      'pt': 'nutrição',
    },
    's722d4e1': {
      'en': 'calorie ',
      'es': 'caloría',
      'fr': 'calorie',
      'pt': 'caloria',
    },
    'sy261r4j': {
      'en': 'grams',
      'es': 'gramos',
      'fr': 'grammes',
      'pt': 'gramas',
    },
    's98kjisk': {
      'en': 'Price',
      'es': 'Precio',
      'fr': 'Prix',
      'pt': 'Preço',
    },
    '5jpuih41': {
      'en': 'Price',
      'es': 'Precio',
      'fr': 'Prix',
      'pt': 'Preço',
    },
    'g83xffi4': {
      'en': 'Ingredients',
      'es': 'Ingredientes',
      'fr': 'Ingrédients',
      'pt': 'Ingredientes',
    },
    '9d7grnzl': {
      'en': 'Add Ingredients',
      'es': 'Añadir ingredientes',
      'fr': 'Ajouter les ingrédients',
      'pt': 'Adicionar ingredientes',
    },
    '9dtqo0td': {
      'en': '1 tsp salt',
      'es': '1 cucharadita de sal',
      'fr': '1 cuillère à café de sel',
      'pt': '1 colher de chá de sal',
    },
    'tfsdnvzw': {
      'en': 'Instructions',
      'es': 'Instrucciones',
      'fr': 'Instructions',
      'pt': 'Instruções',
    },
    'wqvh1rfl': {
      'en': 'Add Instructions',
      'es': 'Agregar instrucciones',
      'fr': 'Ajouter des instructions',
      'pt': 'Adicionar instruções',
    },
    '5nf0ka9t': {
      'en': '1',
      'es': '1',
      'fr': '1',
      'pt': '1',
    },
    'wdkwoax9': {
      'en': '2',
      'es': '2',
      'fr': '2',
      'pt': '2',
    },
    'z0fp0z7p': {
      'en': 'Add wet ingredients and stir until combined',
      'es':
          'Agregue los ingredientes húmedos y revuelva hasta que se combinen.',
      'fr':
          'Ajouter les ingrédients humides et remuer jusqu\'à ce qu\'ils soient combinés.',
      'pt': 'Adicione os ingredientes molhados e mexa até incorporar',
    },
    '04dq5b1j': {
      'en': 'Save Recipe',
      'es': 'Guardar receta',
      'fr': 'Enregistrer la recette',
      'pt': 'Salvar receita',
    },
  },
  // addmenu
  {
    'm2fy3alz': {
      'en': 'Add Menu',
      'es': 'Agregar menú',
      'fr': 'Ajouter un menu',
      'pt': 'Adicionar Menu',
    },
    'zqkx8fnx': {
      'en': 'Name',
      'es': 'Nombre',
      'fr': 'Nom',
      'pt': 'Nome',
    },
    'jttjlqia': {
      'en': 'Name',
      'es': 'Nombre',
      'fr': 'Nom',
      'pt': 'Nome',
    },
    'zhj3gtjs': {
      'en': 'Save',
      'es': 'Ahorrar',
      'fr': 'Sauvegarder',
      'pt': 'Salvar',
    },
  },
  // selectmenu
  {
    'tcesx9fm': {
      'en': 'Select a menu',
      'es': 'Seleccione un menú',
      'fr': 'Sélectionnez un menu',
      'pt': 'Selecione um menu',
    },
  },
  // empty
  {
    'k74gfudi': {
      'en': 'No Activity',
      'es': 'Sin actividad',
      'fr': 'Aucune activité',
      'pt': 'Nenhuma atividade',
    },
  },
  // resturantNave
  {
    '4pu19abn': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
      'pt': 'Lar',
    },
    'lx90psxb': {
      'en': 'Track Order',
      'es': 'Seguimiento de pedidos',
      'fr': 'Suivi de commande',
      'pt': 'Acompanhar pedido',
    },
    'ons0dggj': {
      'en': 'Cart',
      'es': 'Carro',
      'fr': 'Panier',
      'pt': 'Carrinho',
    },
    'nlqicxcv': {
      'en': 'Setting',
      'es': 'Configuración',
      'fr': 'Paramètre',
      'pt': 'Contexto',
    },
  },
  // businessReview
  {
    '87cub617': {
      'en': 'Hello World',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
      'pt': 'Olá Mundo',
    },
    '5zyfrrro': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'i7vogtvb': {
      'en': 'Type your review',
      'es': 'Escribe tu reseña',
      'fr': 'Tapez votre avis',
      'pt': 'Digite sua avaliação',
    },
    'e8zi984v': {
      'en': 'Submit',
      'es': 'Entregar',
      'fr': 'Soumettre',
      'pt': 'Enviar',
    },
  },
  // card21
  {
    'uj0pvudi': {
      'en': '•',
      'es': '•',
      'fr': '•',
      'pt': '•',
    },
    '26fp6b2r': {
      'en': 'View',
      'es': 'Vista',
      'fr': 'Voir',
      'pt': 'Visualizar',
    },
    '9v57yev0': {
      'en': 'Free',
      'es': 'Gratis',
      'fr': 'Gratuit',
      'pt': 'Livre',
    },
  },
  // myWall
  {
    '18jghuu8': {
      'en': 'Say something nice',
      'es': 'Di algo agradable',
      'fr': 'Dis quelque chose de gentil',
      'pt': 'Diga algo legal',
    },
  },
  // myWallProfile
  {
    'uykyibg4': {
      'en': 'My Wall',
      'es': 'Mi muro',
      'fr': 'Mon mur',
      'pt': 'Minha parede',
    },
  },
  // businessSearchResult
  {
    'tg2sgrwj': {
      'en': 'Category',
      'es': 'Categoría',
      'fr': 'Catégorie',
      'pt': 'Categoria',
    },
  },
  // emptylist
  {
    'hm8xwj6m': {
      'en': 'No Items Found',
      'es': 'No se encontraron artículos',
      'fr': 'Aucun élément trouvé',
      'pt': 'Nenhum item encontrado',
    },
    'pq7g51ko': {
      'en': 'Your list is currently empty. ',
      'es': 'Su lista actualmente está vacía.',
      'fr': 'Votre liste est actuellement vide.',
      'pt': 'Sua lista está vazia no momento.',
    },
  },
  // searchFilterCat
  {
    'lbcu3zip': {
      'en': 'Filters',
      'es': 'Filtros',
      'fr': 'Filtres',
      'pt': 'Filtros',
    },
    'c24ozuo0': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'q964884y': {
      'en': 'Search',
      'es': 'Buscar',
      'fr': 'Recherche',
      'pt': 'Procurar',
    },
    'p7tjp2yf': {
      'en': 'Category',
      'es': 'Categoría',
      'fr': 'Catégorie',
      'pt': 'Categoria',
    },
    'y7gf0lqu': {
      'en': 'Entrepreneurs',
      'es': 'Emprendedores',
      'fr': 'Entrepreneurs',
      'pt': 'Empreendedores',
    },
    'jpq9idmq': {
      'en': 'Students',
      'es': 'Estudiantes',
      'fr': 'Étudiants',
      'pt': 'Estudantes',
    },
    'cs59bqtw': {
      'en': 'Athletes',
      'es': 'Atletas',
      'fr': 'Athlètes',
      'pt': 'Atletas',
    },
    'tfvmjx76': {
      'en': 'Artisans',
      'es': 'artesanos',
      'fr': 'Artisans',
      'pt': 'Artesãos',
    },
    '6mn48ohy': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'se4lih3u': {
      'en': 'Select country',
      'es': 'Seleccionar país',
      'fr': 'Sélectionnez un pays',
      'pt': 'Selecione o país',
    },
    'jtcit37c': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
      'pt': 'Procurar...',
    },
    '4le5dpeu': {
      'en': 'select profession',
      'es': 'seleccionar profesión',
      'fr': 'sélectionner une profession',
      'pt': 'selecione profissão',
    },
    'r53c0ltv': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
      'pt': 'Procurar...',
    },
    '5mrf5me5': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'pt': 'Cancelar',
    },
    'ocl6pwxd': {
      'en': 'Apply',
      'es': 'Aplicar',
      'fr': 'Appliquer',
      'pt': 'Aplicar',
    },
  },
  // eventFilter
  {
    'onsm1t0i': {
      'en': 'Filters',
      'es': 'Filtros',
      'fr': 'Filtres',
      'pt': 'Filtros',
    },
    'cvvzmcjc': {
      'en': 'Search Event',
      'es': 'Buscar evento',
      'fr': 'Rechercher un événement',
      'pt': 'Pesquisar Evento',
    },
    'n51itkoo': {
      'en': 'Category',
      'es': 'Categoría',
      'fr': 'Catégorie',
      'pt': 'Categoria',
    },
    'yrja0uxz': {
      'en': 'Sport',
      'es': 'Deporte',
      'fr': 'Sport',
      'pt': 'Esporte',
    },
    'kbnh76q1': {
      'en': 'Food',
      'es': 'Alimento',
      'fr': 'Nourriture',
      'pt': 'Comida',
    },
    '20mewptn': {
      'en': 'Select Country/Date',
      'es': 'Seleccionar país/fecha',
      'fr': 'Sélectionnez le pays/la date',
      'pt': 'Selecione País/Data',
    },
    'tk4dcuz0': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'gd2yscef': {
      'en': 'Select country',
      'es': 'Seleccionar país',
      'fr': 'Sélectionnez un pays',
      'pt': 'Selecione o país',
    },
    'jnawhw0s': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
      'pt': 'Procurar...',
    },
    'qirnn7n6': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'pt': 'Cancelar',
    },
    'oxwcypro': {
      'en': 'Apply',
      'es': 'Aplicar',
      'fr': 'Appliquer',
      'pt': 'Aplicar',
    },
  },
  // communityFilter
  {
    's9cmoxcp': {
      'en': 'Filters',
      'es': 'Filtros',
      'fr': 'Filtres',
      'pt': 'Filtros',
    },
    'x3rwxt5h': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'h4kd8lbi': {
      'en': 'search group',
      'es': 'grupo de búsqueda',
      'fr': 'groupe de recherche',
      'pt': 'grupo de pesquisa',
    },
    'jqaar7ke': {
      'en': 'Category',
      'es': 'Categoría',
      'fr': 'Catégorie',
      'pt': 'Categoria',
    },
    'i0f6ci69': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'd3fssr5n': {
      'en': 'Select country',
      'es': 'Seleccionar país',
      'fr': 'Sélectionnez un pays',
      'pt': 'Selecione o país',
    },
    'hc1ccfpr': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
      'pt': 'Procurar...',
    },
    'pdqbtqrt': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'pt': 'Cancelar',
    },
    '12ic93mw': {
      'en': 'Apply',
      'es': 'Aplicar',
      'fr': 'Appliquer',
      'pt': 'Aplicar',
    },
  },
  // businessFilter
  {
    'v1kh0kjv': {
      'en': 'Filters',
      'es': 'Filtros',
      'fr': 'Filtres',
      'pt': 'Filtros',
    },
    'ym093vww': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'b5sqopys': {
      'en': 'search business',
      'es': 'negocio de búsqueda',
      'fr': 'recherche d\'entreprise',
      'pt': 'pesquisar negócios',
    },
    'ffx1z8m4': {
      'en': 'Business Category',
      'es': 'Categoría de negocio',
      'fr': 'Catégorie d\'entreprise',
      'pt': 'Categoria de negócios',
    },
    'd18q2de6': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '7z4i3jqy': {
      'en': 'Select country',
      'es': 'Seleccionar país',
      'fr': 'Sélectionnez un pays',
      'pt': 'Selecione o país',
    },
    '1nqoglry': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
      'pt': 'Procurar...',
    },
    'rkk5k6kd': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'pt': 'Cancelar',
    },
    '4cqu7kg2': {
      'en': 'Apply',
      'es': 'Aplicar',
      'fr': 'Appliquer',
      'pt': 'Aplicar',
    },
  },
  // Miscellaneous
  {
    'qcglg0bu': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    't8hni2k7': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'm3rt2fal': {
      'en': 'the app requires your microphone access to  record your voice',
      'es': 'La aplicación requiere acceso a tu micrófono para grabar tu voz.',
      'fr':
          'l\'application nécessite l\'accès à votre microphone pour enregistrer votre voix',
      'pt': 'o aplicativo requer acesso ao seu microfone para gravar sua voz',
    },
    'guc1kzu3': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'vw3xl833': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '6gp0kmrx': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'nny91a2z': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '56rzlr3i': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'p2q46p3v': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'k2ydfg4t': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '6swojp2e': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'qsng6hn1': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '4jp5sqa2': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'ns6q8qcz': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'ppuaq5mv': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '105tedbg': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'pxycvyw3': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '1riweaw4': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'du0tsd84': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    't0u5s45v': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'nbn0qr81': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'kygblkx4': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'jhhfscy9': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'nh4ykxdr': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'vk4dexge': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '8b94lakp': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'l1ydoxyx': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '0fb38wxo': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
