require 'require_all'
require_all 'lib/caliper/entities/entity.rb'
require_all 'lib/caliper/entities/software_application.rb'
require_all 'lib/caliper/entities/lis/person.rb'
require_all 'lib/caliper/entities/lis/membership.rb'
require_all 'lib/caliper/entities/lis/roles.rb'
require_all 'lib/caliper/entities/lis/status.rb'
require_all 'lib/caliper/entities/lis/course_section.rb'
require_all 'lib/caliper/entities/lis/course_offering.rb'
require_all 'lib/caliper/entities/lis/group.rb'
require_all 'lib/caliper/entities/reading/epub_volume.rb'
require_all 'lib/caliper/entities/assessment/assessment.rb'
require_all 'lib/caliper/entities/assessment/assessment_item.rb'
require_all 'lib/caliper/entities/assignable/attempt.rb'
require_all 'lib/caliper/entities/assignable/assignable_digital_resource.rb'
require_all 'lib/caliper/event/assessment_item_event.rb'
require_all 'lib/caliper/profiles/assessment_profile.rb'
require 'json_spec'

module Caliper
  module Event

    describe AssessmentItemEvent do

      it 'should ensure that a AssessmentItemEvent (Started) is correctly created and serialized' do

        # The Actor  = Person/Student))
        student = Caliper::Entities::LIS::Person.new
        student.id = 'https://some-university.edu/user/554433'
        membership1 = Caliper::Entities::LIS::Membership.new
        membership1.id = "https://some-university.edu/membership/001"
        membership1.member = "https://some-university.edu/user/554433"
        membership1.organization = "https://some-university.edu/politicalScience/2015/american-revolution-101"
        membership1.roles = [Caliper::Entities::LIS::Roles::LEARNER]
        membership1.status = Caliper::Entities::LIS::Status::ACTIVE
        membership1.dateCreated = "2015-08-01T06:00:00.000Z"
        membership1.dateModified = nil;
        membership2 = Caliper::Entities::LIS::Membership.new
        membership2.id = "https://some-university.edu/membership/002"
        membership2.member = "https://some-university.edu/user/554433"
        membership2.organization = "https://some-university.edu/politicalScience/2015/american-revolution-101/section/001"
        membership2.roles = [Caliper::Entities::LIS::Roles::LEARNER]
        membership2.status = Caliper::Entities::LIS::Status::ACTIVE
        membership2.dateCreated = "2015-08-01T06:00:00.000Z"
        membership2.dateModified = nil
        membership3 = Caliper::Entities::LIS::Membership.new
        membership3.id = "https://some-university.edu/membership/003"
        membership3.member = "https://some-university.edu/user/554433"
        membership3.organization = "https://some-university.edu/politicalScience/2015/american-revolution-101/section/001/group/001"
        membership3.roles = [Caliper::Entities::LIS::Roles::LEARNER]
        membership3.status = Caliper::Entities::LIS::Status::ACTIVE
        membership3.dateCreated = "2015-08-01T06:00:00.000Z"
        membership3.dateModified = nil
        student.hasMembership = [membership1, membership2, membership3]
        student.dateCreated = '2015-08-01T06:00:00.000Z'
        student.dateModified = '2015-09-02T11:30:00.000Z'
        # puts "new student = #{student.to_json}"

        # The Action
        action = Caliper::Profiles::AssessmentActions::STARTED

        # # The Object being interacted with by the Actor  = Assessment)
        # assessment = Caliper::Entities::Assessment::Assessment.new
        # assessment.id = "https://some-university.edu/politicalScience/2015/american-revolution-101/assessment1"
        # assessment.name = "American Revolution - Key Figures Assessment"
        # assessment.dateModified =  '2015-09-02T11:30:00.000Z'
        # assessment.dateCreated =  '2015-08-01T06:00:00.000Z'
        # assessment.datePublished =  '2015-08-15T09:30:00.000Z'
        # assessment.version = "1.0"
        # assessment.dateToActivate = '2015-08-16T05:00:00.000Z'
        # assessment.dateToShow =  '2015-08-16T05:00:00.000Z'
        # assessment.dateToStartOn = "2015-08-16T05:00:00.000Z"
        # assessment.dateToSubmit = "2015-09-28T11:59:59.000Z"
        # assessment.maxAttempts = 2
        # assessment.maxSubmits = 2
        # assessment.maxScore = 3.0

        # # The Assessment has three items
        # assessmentItem1 = Caliper::Entities::Assessment::AssessmentItem.new
        # assessmentItem1.id = "https://some-university.edu/politicalScience/2015/american-revolution-101/assessment1/item1"
        # assessmentItem1.name = "Assessment Item 1"
        # assessmentItem1.isPartOf = assessment.id
        # assessmentItem1.maxAttempts = 2
        # assessmentItem1.maxSubmits = 2
        # assessmentItem1.maxScore = 1.0
        # assessmentItem1.dateCreated = nil
        # assessmentItem1.dateModified = nil
        # assessmentItem1.version = "1.0"
        # assessmentItem1.isTimeDependent = false

        # assessmentItem2 = Caliper::Entities::Assessment::AssessmentItem.new
        # assessmentItem2.id = "https://some-university.edu/politicalScience/2015/american-revolution-101/assessment1/item2"
        # assessmentItem2.name = "Assessment Item 2"
        # assessmentItem2.isPartOf = assessment.id
        # assessmentItem2.maxAttempts = 2
        # assessmentItem2.maxSubmits = 2
        # assessmentItem2.maxScore = 1.0
        # assessmentItem2.dateCreated = nil
        # assessmentItem2.dateModified = nil
        # assessmentItem2.version = "1.0"
        # assessmentItem2.isTimeDependent = false

        # assessmentItem3 = Caliper::Entities::Assessment::AssessmentItem.new
        # assessmentItem3.id = "https://some-university.edu/politicalScience/2015/american-revolution-101/assessment1/item3"
        # assessmentItem3.name = "Assessment Item 3"
        # assessmentItem3.isPartOf = assessment.id
        # assessmentItem3.maxAttempts = 2
        # assessmentItem3.maxSubmits = 2
        # assessmentItem3.maxScore = 1.0
        # assessmentItem3.dateCreated = nil
        # assessmentItem3.dateModified = nil
        # assessmentItem3.version = "1.0"
        # assessmentItem3.isTimeDependent = false

        # assessment.assessmentItems = [assessmentItem1, assessmentItem2, assessmentItem3]

        # # The target object within the Event Object
        # target = nil;

        # # The attempt object  = Attempt) within the Event Object
        # attempt = Caliper::Entities::Assignable::Attempt.new
        # attempt.id = "https://some-university.edu/politicalScience/2015/american-revolution-101/assessment1/attempt1"
        # attempt.actor = "https://some-university.edu/user/554433"
        # attempt.assignable = "https://some-university.edu/politicalScience/2015/american-revolution-101/assessment1"
        # attempt.dateCreated = "2015-08-01T06:00:00.000Z"
        # attempt.dateModified = nil
        # attempt.count = 1
        # attempt.startedAtTime = "2015-09-15T10:15:00.000Z"
        # attempt.duration = nil
        # attempt.endedAtTime = nil
        # attempt.extensions = {}
        # attempt.name = nil

        # The Object (edApp)
        edApp = Caliper::Entities::SoftwareApplication.new
        edApp.id = 'https://com.sat/super-assessment-tool'
        edApp.name = 'Super Assessment Tool'
        edApp.hasMembership = []
        edApp.dateCreated = '2015-08-01T06:00:00.000Z'
        edApp.dateModified = nil

        #LIS Course Offering
        courseOffering = Caliper::Entities::LIS::CourseOffering.new
        courseOffering.id = "https://some-university.edu/politicalScience/2015/american-revolution-101"
        courseOffering.name = "Political Science 101: The American Revolution"
        courseOffering.courseNumber = "POL101"
        courseOffering.academicSession = "Fall-2015"
        courseOffering.membership = []
        courseOffering.subOrganizationOf = nil
        courseOffering.dateCreated = '2015-08-01T06:00:00.000Z'
        courseOffering.dateModified = '2015-09-02T11:30:00.000Z'

        # The LIS Course Section for the Caliper Event
        course = Caliper::Entities::LIS::CourseSection.new
        course.id = 'https://some-university.edu/politicalScience/2015/american-revolution-101/section/001'
        course.name = 'American Revolution 101'
        course.courseNumber = "POL101"
        course.academicSession = "Fall-2015"
        course.category = nil
        course.membership = [membership2]
        course.subOrganizationOf = courseOffering
        course.dateCreated = '2015-08-01T06:00:00.000Z'
        course.dateModified = '2015-09-02T11:30:00.000Z'

        # LIS Group
        group = Caliper::Entities::LIS::Group.new
        group.id = "https://some-university.edu/politicalScience/2015/american-revolution-101/section/001/group/001"
        group.name = "Discussion Group 001"
        group.membership = [membership3]
        group.subOrganizationOf = course
        group.dateCreated = '2015-08-01T06:00:00.000Z'
        group.dateModified = nil

        # The Assessment Event
        assessment_item_started_event = AssessmentItemEvent.new
        assessment_item_started_event.actor  = student
        assessment_item_started_event.action = action
        # assessment_item_started_event.object = assessment
        assessment_item_started_event.target = nil
        # assessment_item_started_event.generated = attempt
        assessment_item_started_event.edApp  = edApp
        assessment_item_started_event.group = group
        assessment_item_started_event.startedAtTime = '2015-09-15T10:15:00.000Z'
        assessment_item_started_event.endedAtTime = nil
        assessment_item_started_event.duration = nil
        # puts "Event JSON = #{assessment_item_started_event.to_json}'"

        # Load JSON from caliper-common-fixtures for comparison
        # NOTE - sym link to caliper-common-fixtures needs to exist under spec/fixtures
        file = File.read('spec/fixtures/caliperAssessmentItemStartedEvent.json')
        data_hash = JSON.parse(file)
        expected_json = data_hash.to_json # convert hash back to JSON string after parse
        # assessment_item_started_event.to_json.should be_json_eql(expected_json)#.excluding("actor", "action", "object", "target", "generated", "edApp", "group")

        # puts "JSON from file = #{data_hash}"
        deser_assessment_item_started_event = AssessmentItemEvent.new
        deser_assessment_item_started_event.from_json data_hash
        # puts "AssessmentItemEvent from JSON = #{deser_assessment_item_started_event.to_json}"

        # Ensure that the deserialized bookmark event object conforms
        # expect(assessment_item_started_event).to eql(deser_assessment_item_started_event)

      end

    end
  end
end