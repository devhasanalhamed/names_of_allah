import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import '../models/names.dart';

class DataProvider with ChangeNotifier {
  var toggleFavorite = false;
  static final List<Names> _namesOfAllah = [
//الأسماء الواردة في القران
    Names(
      id: 1,
      name: 'الله',
      meaning: 'هو الله الإله المألوه المعبود بحق',
      search: 'الله',
      favorite: false,
      open: false,
    ),
    Names(
      id: 2,
      name: 'الأحد',
      meaning:
          'الفرد، المتفرد بصفات الكمال، الذي لانظير له ولامثيل له في ذاته ولا في صفاته وأفعاله وألوهيته',
      search: 'الاحد الأحد',
      favorite: true,
      open: false,
    ),
    Names(
      id: 3,
      name: 'الأعلى',
      meaning:
          'الذي علا على كل شيء، فمهما تصور العبد عالياً فالله أعلى منه، فله العلو المطلق في ذاته وصفاته',
      search: 'الاعلى الأعلى',
      favorite: false,
      open: false,
    ),
    Names(
      id: 4,
      name: 'الأكرم ',
      meaning: 'الذي لا يوازي كرمه كرم، ولا يعادله في كرمه كريم',
      search: 'الاكرم الأكرم',
      favorite: false,
      open: false,
    ),
    Names(
      id: 5,
      name: 'الإله ',
      meaning: 'المألوه المعبود ، المستحق للألوهية والعبادة وحده',
      search: 'الاله الإله',
      favorite: false,
      open: false,
    ),
    Names(
      id: 6,
      name: 'الأول',
      meaning: 'الذي ليس لوجوده بداية، فكل ما سواه كائن بعد أن لم يكن .',
      search: 'الاول الأول',
      favorite: false,
      open: false,
    ),
    Names(
      id: 7,
      name: 'الآخر',
      meaning:
          'الذي ليس لوجوده نهاية، بل له الخلود المطلق، والبقاء الدائم، لا يفنى ولا يبيد ',
      search: 'الاخر الآخر',
      favorite: false,
      open: false,
    ),
    Names(
      id: 8,
      name: 'الظاهر',
      meaning:
          'الذي استعلى على خلقه بذاته، واستعلى عليهم بحججه وآياته، وقهرهم بقوته وسلطانه ',
      search: 'الظاهر',
      favorite: true,
      open: false,
    ),
    Names(
        id: 9,
        name: 'الباطن',
        meaning:
            ' المحتجب عن خلقه فلا يرى في الدنيا، وإنما يُعلم وجوده بدلائل خلقه وآثار صنعه.',
        search: 'الباطن',
        favorite: false,
        open: false),
    Names(
      id: 10,
      name: 'البارئ ',
      meaning: 'وهو في معنى الخالق إلا أنه يدل على مطلق الخلق من غير تقدير .',
      search: 'البارئ الباري البارء',
      favorite: false,
      open: false,
    ),
    Names(
      id: 11,
      name: 'البر',
      meaning: 'العطوف على عباده المحسن إليهم، الذي عم بره وإحسانه جميع خلقه',
      search: 'البر',
      favorite: false,
      open: false,
    ),
    Names(
      id: 12,
      name: 'البصير',
      meaning: 'الذي يرى المبصرات، لا يخفى عليه خافية في الأرض ولا في السماء',
      search: 'البصير',
      favorite: false,
      open: false,
    ),
    Names(
      id: 13,
      name: 'التواب ',
      meaning: 'الذي يقبل توبة عباده، وكلما تكررت التوبة تكرر القبول',
      search: 'التواب',
      favorite: false,
      open: false,
    ),
    Names(
      id: 14,
      name: 'الجبار',
      meaning:
          'مأخوذ من الجبر والقهر والتعالي فهو سبحانه: المستعلي المتعاظم الذي لا يخرج أحد عن أمره الكوني وسلطانه القدري، فهو الذي يحيي ويميت، ويرزق ويفقر، ويعز ويذل، ويفعل ما يشاء في خلقه لا راد لأمره، ولا ناقض لقضائه',
      search: 'الجبار',
      favorite: false,
      open: false,
    ),
    Names(
      id: 15,
      name: 'الحافظ ',
      meaning: 'الصائن عبده عن أسباب الهلكة في أمور دينه ودنياه ',
      search: 'الحافظ',
      favorite: false,
      open: false,
    ),
    Names(
      id: 16,
      name: 'الحسيب',
      meaning:
          'أنه الشريف الذي فاق شرفه كل شرف، والعالم الذي يعلم مقادير الأشياء وأعدادها، والكافي الذي يحفظ ويرزق',
      search: 'الحسيب',
      favorite: false,
      open: false,
    ),
    Names(
      id: 17,
      name: 'الحفيظ ',
      meaning:
          'الحافظ، فهو الذي يحفظ السماء أن تقع على الأرض، ويحفظ الأرض أن تهوي، ويحفظ الكواكب أن تصطدم ببعضها، ويحفظ للحياة نظامها، ويحفظ على عباده ما عملوه من خير وشر وطاعة ومعصية',
      search: 'الحفيظ',
      favorite: false,
      open: false,
    ),
    Names(
      id: 18,
      name: 'الحفي',
      meaning:
          'الذي يعود عبده على الإجابة إذا دعاه، فهو لطيف به سبحانه وتعالى، وفسره بعض أهل العلم فقالوا البر اللطيف بعباده',
      search: 'الحفي',
      favorite: false,
      open: false,
    ),
    // Names(
    //   name: 'الحق',
    //   meaning:
    //       'الذي لا يسع أحد إنكاره، بل يجب إثباته والاعتراف به، لتظاهر الأدلة على وجوده سبحانه',
    //   search: 'الحق',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'المبين',
    //   meaning:
    //       'الذي لا يخفى، لظهور دلائل وجوده وآثار صنعه . كما أنه المبين لعباده سبل الرشاد، والموضح لهم طرق الغواية',
    //   search: 'المبين',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الحكيم',
    //   meaning:
    //       'الذي يضع الأمور مواضعها، ولا يفعل إلا الصواب، ولا يقول إلا الحق، وأفعاله سديدة، وصنعه متقن',
    //   search: 'الحكيم',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الحليم',
    //   meaning:
    //       'الذي لا يحبس إنعامه وأفضاله عن عباده لأجل ذنوبهم، بل يرزقهم ويحفظهم ويرشدهم حتى يعودوا إليه ويتوبوا',
    //   search: 'الحليم',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الحميد',
    //   meaning:
    //       'المحمود الذي استحق الحمد بفعاله، فهو الذي يحمد في السراء والضراء، وفي الشدة والرخاء، وأفعاله لا تخرج عن مقتضى الحكمة والرحمة والعدل',
    //   search: 'الحميد',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الحي',
    //   meaning:
    //       'أنه ذو الحياة التامة الكاملة – سبحانه - فحياته ذاتية أزلية، لم يسبقها موت ولا عدم، على خلاف سائر الأحياء . واسم الحي يتضمن جميع الصفات الذاتية كالعلم والقدرة والإرادة وغيرها',
    //   search: 'الحي',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'القيوم',
    //   meaning: 'أنه قائم على كل شيء بالحفظ والرعاية والتدبير',
    //   search: 'القيوم',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الخبير',
    //   meaning:
    //       'الذي انتهى علمه إلى الإحاطة ببواطن الأشياء وخفاياها كما أحاط بظواهرها',
    //   search: 'الخبير',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الخالق',
    //   meaning:
    //       'مأخوذ من الخلق وهو الإيجاد والتقدير فالله سبحانه هو الذي قدّر الأشياء قبل وجودها، وأخرجها من العدم إلى الوجود',
    //   search: 'الخالق',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الخلاق',
    //   meaning:
    //       'وهو في معنى الخالق ويزيد عليه في دلالته على كثرة خلق الله واتساعه',
    //   search: 'الخلاق',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الرؤوف',
    //   meaning: 'مريد التخفيف عن عباده',
    //   search: 'الرؤوف الرءوف',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الرحمن',
    //   meaning:
    //       'ذو الرحمة التي لا نظير له فيها، فرحمته { وسعت كل شيء }(الأعراف: 156) من كافر، ومؤمن، وحجر، وشجر، وجميع خلقه',
    //   search: 'الرحمن',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الرحيم',
    //   meaning: 'وهو يدلَّ على صفة الرحمة الخاصة التي ينالها المؤمنون',
    //   search: 'الرحيم',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الرزاق',
    //   meaning: 'المتكفل بالرزق، والقائم على كل نفس بما يقيمها من قوتها',
    //   search: 'الرزاق',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الرقيب',
    //   meaning: 'الذي لا يغفل عما خلق بل يحفظ خلقه ولا يغيب عنه منهم شيء',
    //   search: 'الرقيب',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'السلام',
    //   meaning:
    //       'واسم السلام يحمل معنيين: الأول: أنه ذو السلامة أي: البراءة من العيوب والنقائص. والثاني: أن العباد سلموا من ظلمه فهو – سبحانه - الحكم العدل الذي حرّم الظلم على نفسه، وجعله بين عباده محرماً',
    //   search: 'السلام',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'السميع',
    //   meaning:
    //       'الذي يسمع كل الأصوات صغيرها وكبيرها، سرّها وجهرها، فيسمع دبيب النملة السوداء في الصخرة الصماء في الليلة الظلماء لا يخفى عليه شيء في الأرض ولا في السماء',
    //   search: 'السميع',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الشاكر',
    //   meaning: 'المادح والمثني لمن يطيعه، والمثيب على الطاعة بأكثر منها',
    //   search: 'الشاكر',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الشكور',
    //   meaning: 'الذي يشكر على يسير الطاعة، ويثيب عليها بأضعافها',
    //   search: 'الشكور',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الشهيد',
    //   meaning: 'المطلع على ما لا يعلمه المخلوقون إلا بالحضور',
    //   search: 'الشهيد',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الصمد',
    //   meaning:
    //       'الذي بلغ الغاية في سؤدده وشرفه، وهو الذي تقبل إليه الخلائق لقضاء حاجاتها',
    //   search: 'الصمد',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'العالم',
    //   meaning:
    //       'العالم بكل شيء؛ الذي لكمال علمه يعلم ما بين أيدي الخلائق وما خلفهم، فلا تسقط ورقة إلا بعلمه، ولا تتحرك ذرة إلا بإذنه، يعلم دبيب الخواطر في القلوب حيث لا يطلع عليها الملك، ويعلم ما سيكون منها حيث لا يطلع عليه القلب',
    //   search: 'العالم',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'العزيز',
    //   meaning:
    //       'مأخوذ من المنعة والقوة والشرف فهو سبحانه المنيع الذي لا يغلب، والقوي الذي لا يقهر، والشريف الذي لا يُذَل',
    //   search: 'العزيز',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'العظيم',
    //   meaning:
    //       'ذو العظمة في ذاته وصفاته، فذاته أعظم من كل ذات، وصفاته أعلى من كل الصفات',
    //   search: 'العظيم',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'العفو',
    //   meaning: 'الذي يتجاوز عن الذنوب ويصفح عن فاعليها',
    //   search: 'العفو',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'العليم',
    //   meaning: 'أي العالم بكل شيء، لا تخفى عليه خافية في الأرض ولا في السماء',
    //   search: 'العليم',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'العلي',
    //   meaning:
    //       'الذي ليس فوقه أحد فله العلو المطلق في ذاته وصفاته، لا يشاركه فيه أحد',
    //   search: 'العلي',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الغفار',
    //   meaning:
    //       'مأخوذ من الغَفْرِ وهو التغطية فهو سبحانه كثير الستر والتجاوز عن ذنوب عباده وزلاتهم',
    //   search: 'الغفار',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الغفور',
    //   meaning:
    //       'الذي يستر ذنوب خلقه ويتجاوز عنها، فلا يؤاخذ بها، ولا يعاقب عليها',
    //   search: 'الغفور',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الغني ',
    //   meaning: 'هو الكامل الذي لا يحتاج إلى غيره، بل غيره محتاج إليه',
    //   search: 'الغني',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الفتاح',
    //   meaning:
    //       'الذي يفتح أبواب رحمته على عباده، ويحكم بينهم فيما هم فيه يختلفون',
    //   search: 'الفتاح',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'القادر',
    //   meaning:
    //       'المتصف بالقدرة المطلقة فلا يعجزه شيء، ولا يكون في ملكه إلا ما يريد سبحانه',
    //   search: 'القادر',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'القاهر',
    //   meaning:
    //       'أنه الذي قهر عباده بما خلقهم عليه من المرض والموت والفقر والذل، فلا يستطيع أحد رد تدبيره والخروج من تقديره',
    //   search: 'القاهر',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'القدوس',
    //   meaning:
    //       'هو اسم يتضمن جميع صفات الكمال، ونفي كل نقيصة لا تليق بجلاله، فالتقديس هو إثبات الفضائل، ونفي الرذائل، فهو – سبحانه - طاهر في نفسه، مطهّر لغيره، وهو المنـزَّه والمنـزِّه',
    //   search: 'القدوس',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'القدير',
    //   meaning: 'الكامل القدرة لا يلابس قدرته عجز بوجه من الوجوه فلا يعجزه شيء',
    //   search: 'القدير',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'القريب',
    //   meaning:
    //       'أنه سبحانه وإن علا على خلقه واستوى على عرشه إلا أن قريب منهم بعلمه وقدرته، لا يخفى عليه شيء، ولا يعجزه شيء',
    //   search: 'القريب',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'القوي',
    //   meaning: 'ذو القوة التامة الذي لا يلحقه العجز في حال من الأحوال',
    //   search: 'القوي',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'القهار',
    //   meaning:
    //       'الذي قهر الجبابرة من عتاة خلقه بالعقوبة، وقهر الخلق كلهم بالموت',
    //   search: 'القهار',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الكبير',
    //   meaning:
    //       'أنه أكبر من كل شيء، وكل شيء دونه، وأنه أعظم من كل شيء، وكل عظيم دونه',
    //   search: 'الكبير',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الكريم',
    //   meaning:
    //       'ذو النفع العظيم لعباده فهو الذي خلقهم ورزقهم، وهو الذي يعفو عن مسيئهم، ويتجاوز عن مذنبهم',
    //   search: 'الكريم',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'اللطيف',
    //   meaning:
    //       'الذي يتلطف بعباده فييسر لهم سبل الخير واليسر، وأسباب الصلاح والبر',
    //   search: 'اللطيف',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'المؤمن',
    //   meaning:
    //       'أنه الذي صدّق المؤمنين في إيمانهم، وصَدَقَ في وعده لهم،  وآمنهم من عذابه',
    //   search: 'المؤمن المومن',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'المتعالي',
    //   meaning:
    //       'الذي ترفّع عما نسبه إليه أهل الكفر والإلحاد من النظراء والأنداد . واستعلى على كل شيء بقدرته',
    //   search: 'المتعالي',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'المتكبر',
    //   meaning:
    //       'مأخوذ من الكبرياء الذي هو عظمة الله تعالى، وتعاليه عن صفات الخلق، لا من الكبر الذي هو مذموم عند الخلق والذي يعني احتقار الناس وغمطهم حقوقهم ',
    //   search: 'المتكبر',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'المتين',
    //   meaning: 'المتصف بالشدة والصلابة',
    //   search: 'المتين',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'المجيب',
    //   meaning: 'الذي يجيب دعاء الداعين، وسؤال السائلين',
    //   search: 'المجيب',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'المجيد',
    //   meaning: 'الواسع الكريم، وأصل المجد في كلام العرب السعة',
    //   search: 'المجيد',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'المحيط',
    //   meaning:
    //       'الذي أحاطت قدرته بجميع خلقه، ووسعهم علمه، فهو الذي { أحاط بكل شيء علما }(الطلاق:12)',
    //   search: 'المحيط',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'المصور',
    //   meaning: 'أنه الذي أنشأ خلقه على صور مختلفة ليتعارفوا بها',
    //   search: 'المصور',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'المقتدر',
    //   meaning: 'الكامل القدرة، الذي لا يمتنع عليه شيء',
    //   search: 'المقتدر',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'المقيت',
    //   meaning: 'الذي دبّر قوت الحيوانات ورزقها، وصرّفه كيف يشاء بحكمته',
    //   search: 'المقيت',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الملك',
    //   meaning:
    //       'الذي ملك خلقه، ونفذ أمره فيهم، ويتميز ملك الله عن ملك غيره أن ملكه مفتقر إليه في إيجاده وإمداده، وأنه تسمى بالملك قبل خلق الممالك، وأنه مستغنٍ عن الأعوان، وأن ملكه عام وممتد في الدنيا والآخرة، وأنه جنده لا يحصون، وأن ملكه لا يبيد، وأنه سبحانه محيط بملكه إحاطة من لا يغيب عنه دقيق ولا جليل',
    //   search: 'الملك',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'المليك',
    //   meaning:
    //       'وهو صيغة مبالغة يدل على كمال ملك الله سبحانه لخلقه حيث يشمل الملك بمعنى الحكم، والملك بمعنى التملك والحيازة فالله هو حاكم الخلق ومالكهم ',
    //   search: 'المليك',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'المولى',
    //   meaning:
    //       'الذي يركن إليه الموحدون، ويعتمد عليه المؤمنون في الشدة والرخاء، والسراء والضراء فينصرهم ويغيثهم ويوفقهم',
    //   search: 'المولى',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'المهيمن',
    //   meaning:
    //       'مأخوذ من الهيمنة، وهي السيطرة على الشيء بقهره، فالله قاهر لخلقه لا يخرج أحد عن إرادته الكونية، وسلطانه القدري فما شاء الله كان، وما لم يشأ لم يكن',
    //   search: 'المهيمن',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'النصير',
    //   meaning: 'الناصر لرسله وأولياءه والمؤمنين',
    //   search: 'النصير',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الواحد ',
    //   meaning: 'المتفرد الذي لا ثاني ولا شريك ولا مثل ولا نظير له',
    //   search: 'الواحد',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الوارث',
    //   meaning:
    //       'الباقي بعد ذهاب غيره، فهو يبقى – سبحانه - بعد ذهاب الخلق وهلاكهم، لأن وجودهم كان به، ووجوده ليس بغيره',
    //   search: 'الوارث',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الواسع',
    //   meaning: 'الغني الذي وسع غناه فقر عباده، ووسع رزقه جميع خلقه',
    //   search: 'الواسع',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الودود',
    //   meaning: 'الذي يُحِب رسله والمؤمنين، ويحبه رسله والمؤمنون',
    //   search: 'الودود',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الوكيل',
    //   meaning: 'الذي توكل بأمر الخلائق فحفظها، وتكفل بأرزاقها، وقام بأمورها',
    //   search: 'الوكيل',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الولي',
    //   meaning:
    //       'القائم على أمور خلقه بالرعاية والحفظ والتدبير وهذه الولاية العامة لجميع خلقه، وهناك الولاية الخاصة والتي تقتضي مزيداً من الرعاية والحفظ والتدبير',
    //   search: 'الولي',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الوهاب',
    //   meaning: 'المتفضل على خلقه بجزيل العطايا وعظيم المنن',
    //   search: 'الوهاب',
    //   favorite: false,
    // ),
    // // الأسماء الواردة في السنة :-
    // Names(
    //   name: 'الجميل',
    //   meaning:
    //       'الذي له سبحانه أَحسن الحسن والجمال المطلق، وهو الجميل بذاته وأسمائه وصفاته وأفعاله؛ فأسماؤه حسنى، وصفاته علا، وأفعاله كلها حسنة',
    //   search: 'الجميل',
    //   favorite: false,
    // ),
    // // Names(
    // //     name: 'الجواد',
    // //     meaning:
    // //         'والله جل شأنه هو الجواد: على الإطلاق الذي عم جوده جميع الكائنات، من أهل الأرض والسماوات، فكل نعمة فمن جوده، فلا يخلو موجود من جوده وإحسانه في هئا الوجود، فهو الجواد لذاته، كما أنه الحي لذاته، السميع والبصير لذاته.',
    // //     search: 'الجواد'),
    // Names(
    //   name: 'الحكم ',
    //   meaning:
    //       'الذي يفصل بين المتخاصمين بالعدل، ويقضي بين المختلفين بالقسط، ويشرّع الشرائع، ويضع الأحكام',
    //   search: 'الحكم',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الحيي',
    //   meaning:
    //       'وهو حيِي سبحانه، لا يفضح عبده المؤمن، بل يعفو ويصفح عنه، ويحلم عليه',
    //   search: 'الحيي',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الرب',
    //   meaning:
    //       'المالك المتصرف في الخلق كيف يشاء، النافذ فيهم أمره متى شاء، والرب من أكثر الأسماء التي يدعى بها الله عز وجل',
    //   search: 'الرب',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الرفيق',
    //   meaning:
    //       'الكثير الرفق في أفعاله، خلق المخلوقات كلها بالتدريج شيئا فشيئا بحسب حكمته ورفقه، مع أنه قادر على خلقها دفعة واحدة، وفي لحظة واحدة، و هو الرفيق في شرعه: في أمره ونهيه، فلم يأخذ عباده بالتكاليف الشاقة مرة واحدة، بل شرع الأحكام شيئا فشيئا، من حال إلى حال، حتى تألفها نفوسهم، وتأنس إليهم طبائعهم، وهو قادر على أن يفرضها عليهم دفعة واحدة',
    //   search: 'الرفيق',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'السبوح',
    //   meaning: 'تنزيه الله عن كل ما لا يليق به من العيوب والنقائص',
    //   search: 'السبوح',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'السيد',
    //   meaning: 'الذي كمل في سؤدده، ملك الخلقِ كلهم، ومالك أمرِهم',
    //   search: 'السيد',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الشافي',
    //   meaning:
    //       'المبريء من الأمراض كلها، وأن كل ما يقع من الدواء والتداوي هو من قبيل التسبب، وأن الشافي على الحقيقة هو الله',
    //   search: 'الشافي',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الطيب',
    //   meaning:
    //       'وهو سبحانه الطيب المنزه عن النقائص والعيوب، فأسماؤه وصفاته وأفعاله كلها طيِبة، وهو طيِب لا يقبل إلا طيِبا',
    //   search: 'الطيب',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'القابض',
    //   meaning: 'الذي يضيّق الرزق على من يشاء ويقترّه',
    //   search: 'القابض',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الباسط',
    //   meaning: 'الذي يوسع رزقه على من يشاء من عباده',
    //   search: 'الباسط',
    //   favorite: false,
    // ),
    // // Names(
    // //     name: 'المحسن',
    // //     meaning:
    // //         'الذي أحسن كل شيء خلقه، فأتقن صنعه، وهو الذي أحسن شرعه، فجعله قائما على الحكمة، والرأفة، والمصلحة، وهو الذي يخص أولياءه بكمال الإحسان في الدنيا: بالعلم، والإيمان، وفي الآخرة الحسنى وزيادة، ما قال تعالى: {للذين أحسنوا الحسنى وزيادة}',
    // //     search: 'المحسن'),
    // Names(
    //   name: 'المعطي',
    //   meaning: 'الذي أعطى كل شيء خلقه، وتولى رزقه',
    //   search: 'المعطي',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'المنان',
    //   meaning: 'المتفضل بعطاياه على عباده',
    //   search: 'المنان',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'الوتر',
    //   meaning: 'الذي لا شريك له',
    //   search: 'الوتر',
    //   favorite: false,
    // ),
    // Names(
    //   name: 'المقدم و المؤخر',
    //   meaning:
    //       'هما من الأسماء المزدوجة المتقابلة التي لايطلق واحد بمفرده على الله إلا مقرونا بالآخر؛ الذي يقدم من يشاء، ويؤخر من يشاء من مخلوقاته؛ في الخلق، والرزق، والفضل؛ فخلق بني آدم وفضلهم على كثير ممن خلق، وأخر آخرين من مخلوقاته، وفضل الأنبياء وقدمهم على الخلق، وفضل بعضهم على بعض، وقدم بعض عباده ورفع بعضهم فوق بعض درجات، وأخر آخرين؛ كل ذلك بفضله وعدله وحكمته سبحانه',
    //   search: 'المقدم و المؤخر',
    //   favorite: false,
    // ),
  ];

  List<Names> _finalList = _namesOfAllah;

  List<Names> get namesOfAllah {
    return [..._finalList];
  }

  void searchInList(String name) {
    _finalList = _namesOfAllah
        .where((element) => element.search.contains(name))
        .toList();
    notifyListeners();
  }

  void returnOriginal() {
    _finalList = _namesOfAllah;
    notifyListeners();
  }

  void toggleFavoriteList() {
    toggleFavorite = !toggleFavorite;
    if (toggleFavorite) {
      _finalList =
          _namesOfAllah.where((element) => element.favorite == true).toList();
    } else {
      returnOriginal();
    }
    notifyListeners();
  }

  void nameSelector(int index) {
    final oldState = _finalList[index].open;
    for (var element in _finalList) {
      element.open = false;
    }
    _finalList[index].open = !oldState;
    notifyListeners();
  }

  void addFavorite(String name) {
    final i = _namesOfAllah.indexWhere((element) => element.name == name);
    _namesOfAllah[i] = Names(
      id: _namesOfAllah[i].id,
      name: _namesOfAllah[i].name,
      meaning: _namesOfAllah[i].meaning,
      search: _namesOfAllah[i].search,
      favorite: !_namesOfAllah[i].favorite,
      open: true,
    );
    notifyListeners();
  }

  Names returnName(int index) {
    final result = _finalList[index];
    return result;
  }

  Future<void> copyToClipboard(context, name, data) async {
    FlutterClipboard.copy('{ $name } ومعناه :  $data')
        .then((value) => showSnackBar(context, 'تم النسخ إلى الحافظة'));
  }

  ScaffoldFeatureController showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        key: UniqueKey(),
        duration: const Duration(milliseconds: 500),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
