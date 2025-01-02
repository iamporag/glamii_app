
class Company {
  final String id;
  final String name;
  final String description;
  final List<Job> jobs;

  Company({
    required this.id,
    required this.name,
    required this.description,
    required this.jobs,
  });
}

class Shop {
  final String name;
  final String description;
  final List<Job> jobs;

  Shop({
    required this.name,
    required this.description,
    required this.jobs,
  });
}

class Job {
  final String title;
  final String description;
  final String sector;
  final String category;
  final String companyId;

  Job(
      {required this.title,
      required this.description,
      required this.sector,
      required this.category,
      required this.companyId});
}

class Posts {
  final String title;
  final String description;
  final String sector;
  final String category;

  Posts({
    required this.title,
    required this.description,
    required this.sector,
    required this.category,
  });
}

class JobCategory {
  final String name;
  final List<Job> jobs;

  JobCategory({
    required this.name,
    required this.jobs,
  });
}

List<Company> companies = [
  Company(
    id: "1",
    name: 'LG',
    description: 'Leading electronics company.',
    jobs: [
      Job(
          title: 'Software Engineer',
          description: 'Develop software for LG products',
          sector: 'Tech',
          category: 'Engineering',
          companyId: "1"),
      Job(
          title: 'HR Manager',
          description: 'Manage HR processes',
          sector: 'HR',
          category: 'Human Resources',
          companyId: "1"),
    ],
  ),
  Company(
    id: "2",
    name: 'Walton',
    description: 'Innovative tech company',
    jobs: [
      Job(
          title: 'Product Designer',
          description: 'Design new products for Walton',
          sector: 'Design',
          category: 'Engineering',
          companyId: "2"),
      Job(
          title: 'Sales Representative',
          description: 'Sell Walton products',
          sector: 'Sales',
          category: 'Sales',
          companyId: "2"),
    ],
  ),
  Company(
    id: "3",
    name: 'Singer',
    description: 'Leading home appliance company.',
    jobs: [
      Job(
          title: 'Marketing Manager',
          description: 'Oversee marketing campaigns',
          sector: 'Marketing',
          category: 'Marketing',
          companyId: "3"),
      Job(
          title: 'Customer Support',
          description: 'Provide customer support for Singer products',
          sector: 'Support',
          category: 'Customer Service',
          companyId: "3"),
    ],
  ),
];

List<JobCategory> jobCategories = [
  JobCategory(
      name: 'Engineering',
      jobs: companies
          .expand((c) => c.jobs)
          .where((job) => job.category == 'Engineering')
          .toList()),
  JobCategory(
      name: 'Sales',
      jobs: companies
          .expand((c) => c.jobs)
          .where((job) => job.category == 'Sales')
          .toList()),
  JobCategory(
      name: 'Marketing',
      jobs: companies
          .expand((c) => c.jobs)
          .where((job) => job.category == 'Marketing')
          .toList()),
  JobCategory(
      name: 'Customer Service',
      jobs: companies
          .expand((c) => c.jobs)
          .where((job) => job.category == 'Customer Service')
          .toList()),
];

// Helper method to get the company by ID
Company? getCompanyById(String companyId) {
  return companies.firstWhere(
    (company) => company.id == companyId,
    orElse: () => Company(id: "", name: "", description: "", jobs: []),
  );
}
