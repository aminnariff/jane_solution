import 'package:jane_solution/views/faqs.dart';

const String lookForUsRedirection = 'https://www.facebook.com/yoursolelution';
const String companyAddress =
    '19 JALAN HUJAN RAHMAT, 3, Jln Klang Lama, Taman Overseas Union, 58200 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur';
const String mobileMapContent =
    '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d127497.0832711684!2d101.652031589911!3d3.018208449026639!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cc4be5cebdf981%3A0xeb99db6552e4cf9c!2sFOOT%20SOUL%20SOLUTIONS%20%2F%20ALIGN%20ORTHOTIC!5e0!3m2!1sen!2smy!4v1666521306586!5m2!1sen!2smy" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>';
const String mapContent =
    '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d127497.0832711684!2d101.652031589911!3d3.018208449026639!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cc4be5cebdf981%3A0xeb99db6552e4cf9c!2sFOOT%20SOUL%20SOLUTIONS%20%2F%20ALIGN%20ORTHOTIC!5e0!3m2!1sen!2smy!4v1666519806323!5m2!1sen!2smy" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>';
const String emailAddress = 'jane.solelution@gmail.com';

List<String> navigationBar = [
  'Home',
  'Get to Know Us',
  'Our Solution & Products',
  'Contact Us',
  'FAQ(s)',
];

List<FaqAttribute> faqList = [
  FaqAttribute(
      question: 'Am I supposed to trim your insoles?',
      description: 'Our ¾ insoles are not meant to be trimmed. Just drop and go.'),
  FaqAttribute(
      question: 'Do your insoles suitable for exercise use?',
      description:
          'Yes. Absolutely! Our insole will help to support your feet which lead to pain free and stress free to your ankle and knee joint thus maximize your exercise performance.'),
  FaqAttribute(question: 'Do your products come in pairs?', description: 'Yes.'),
  FaqAttribute(
      question: 'What is your return policy?',
      description:
          'If you are not fully satisfied with your purchase, you may return unworn merchandise to us within 30 days of purchase. Please note, defective or damaged merchandise can only be returned if it’s unworn.'),
  FaqAttribute(
      question: 'Should I clean your insoles? How?',
      description:
          'It’s a good idea to clean your insoles occasionally. Wipe it with wet cloth or use an old toothbrush with soft bristles to brush it. Do not expose your insole under the sun. DO NOT MACHINE WASH OR DRY.'),
  FaqAttribute(
      question: 'When is the best time to use orthotic insoles?',
      description:
          'a. Over 90% of the people assume that pain is the price to pay that comes with old age and it is NOT TRUE!\n\nb. During the basic 12 years of studied at school we were never taught in schools by teachers, at home by our parents and not even during our working life by our superiors and colleagues. The major contribution to such pain is IGNORANT!\n\nc. It is often when the pain has become unbearable, our foot and legs are deformed and we consulted our therapist and/or doctors, that causes are revealed and it may be too late for some.\n\nd. Orthotic insoles should be worn during pre-school as that is when young kidsarer most active and they have already start wearing shoes. It serves as a mean to provide better balance, stability and protection against over-pronation that would cause 80% of joint pain when they grow older.'),
];
