


SELECT
    "metrics/data_quality/servicerequest_reference_practitioner_unresolved.sql" AS metric_path,
    "servicerequest_reference_practitioner_unresolved" AS metric_name,
    "Proportion of ServiceRequest resources that reference a non-existent practitioner" AS description,
    "SerReq ref. Prac - non-exist" AS short_description,
    "ServiceRequest" AS primary_resource,
    
    [ 'requester.practitionerId' ]
     AS primary_fields,
    
    [ 'Practitioner' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "ServiceRequest.authoredOn" AS metric_date_field,
    "Service request signed date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the service request (draft | active | on-hold | revoked | completed | entered-in-error | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the service request" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationrequest_reference_medicationrequest_unresolved.sql" AS metric_path,
    "medicationrequest_reference_medicationrequest_unresolved" AS metric_name,
    "Proportion of MedicationRequest resources that reference a non-existent parent medication request" AS description,
    "MedReq ref. MedReq - non-exist" AS short_description,
    "MedicationRequest" AS primary_resource,
    
    [ 'requester.practitionerId' , 'basedOn.medicationRequestId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "MedicationRequest.authoredOn" AS metric_date_field,
    "Medication request initial authored date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication request (active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the medication request (inpatient | outpatient | community | discharge)" AS dimension_b_description,
    "intent" AS dimension_c,
    "The intent of the medication request (proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/observation_reference_patient_undefined.sql" AS metric_path,
    "observation_reference_patient_undefined" AS metric_name,
    "Proportion of Observation resources that do not have a patient reference recorded" AS description,
    "Obs ref. Patient - unrecorded" AS short_description,
    "Observation" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Observation.effective.dateTime" AS metric_date_field,
    "Observation effective date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the observation (registered | preliminary | final | amended +)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/procedure_reference_encounter_unresolved.sql" AS metric_path,
    "procedure_reference_encounter_unresolved" AS metric_name,
    "Proportion of LDA Procedure resources that reference a non-existent encounter" AS description,
    "LDA Proc ref. Enc - non-exist" AS short_description,
    "Procedure" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(Procedure.performed.period.start, Procedure.performed.dateTime)" AS metric_date_field,
    "Procedure performed period start date (if absent, procedure performed date)" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the procedure (preparation | in-progress | not-done | on-hold | stopped | completed | entered-in-error | unknown)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationstatement_reference_encounter_undefined.sql" AS metric_path,
    "medicationstatement_reference_encounter_undefined" AS metric_name,
    "Proportion of MedicationStatement resources that do not have an encounter reference recorded" AS description,
    "MedStat ref. Enc - unrecorded" AS short_description,
    "MedicationStatement" AS primary_resource,
    
    [ 'context.encounterId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "MedicationStatement.dateAsserted" AS metric_date_field,
    "Medication statement asserted date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication statement (active | completed | entered-in-error | intended | stopped | on-hold | unknown | not-taken)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationstatement_reference_patient_undefined.sql" AS metric_path,
    "medicationstatement_reference_patient_undefined" AS metric_name,
    "Proportion of MedicationStatement resources that do not have a patient reference recorded" AS description,
    "MedStat ref. Patient - unrecorded" AS short_description,
    "MedicationStatement" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "MedicationStatement.dateAsserted" AS metric_date_field,
    "Medication statement asserted date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication statement (active | completed | entered-in-error | intended | stopped | on-hold | unknown | not-taken)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/encounter_reference_patient_undefined.sql" AS metric_path,
    "encounter_reference_patient_undefined" AS metric_name,
    "Proportion of Encounter resources that do not have a patient reference recorded" AS description,
    "Enc ref. Patient - unrecorded" AS short_description,
    "Encounter" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Encounter.period.start" AS metric_date_field,
    "Encounter start date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the encounter (planned | arrived | triaged | in-progress | onleave | finished | cancelled +)" AS dimension_a_description,
    "latest_encounter_class" AS dimension_b,
    "The latest class of the encounter" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationrequest_reference_encounter_unresolved.sql" AS metric_path,
    "medicationrequest_reference_encounter_unresolved" AS metric_name,
    "Proportion of MedicationRequest resources that reference a non-existent encounter" AS description,
    "MedReq ref. Enc - non-exist" AS short_description,
    "MedicationRequest" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "MedicationRequest.authoredOn" AS metric_date_field,
    "Medication request initial authored date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication request (active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the medication request (inpatient | outpatient | community | discharge)" AS dimension_b_description,
    "intent" AS dimension_c,
    "The intent of the medication request (proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/patient_unknown_gender.sql" AS metric_path,
    "patient_unknown_gender" AS metric_name,
    "Proportion of patients that have unknown gender" AS description,
    "Patients unknown gender" AS short_description,
    "Patient" AS primary_resource,
    
    [ 'gender' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "active" AS dimension_a,
    "The patient active status  (true | false)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/person_reference_patient_undefined.sql" AS metric_path,
    "person_reference_patient_undefined" AS metric_name,
    "Proportion of Person resources that do not have at least one reference to a patient recorded" AS description,
    "Person ref. Patient - unrecorded" AS short_description,
    "Person" AS primary_resource,
    
    [ 'link.target.patientId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "person_active" AS dimension_a,
    "The person active status  (true | false)" AS dimension_a_description,
    "person_gender" AS dimension_b,
    "The gender of the person (male | female | other | unknown)" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/patient_dob_distribution.sql" AS metric_path,
    "patient_dob_distribution" AS metric_name,
    "Patient birthdate distribution" AS description,
    "Patient dob distribution" AS short_description,
    "Patient" AS primary_resource,
    
    [ 'birthdate' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data distribution" AS category,
    "COUNT" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "decade" AS dimension_a,
    "The patient's birth decade'" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationrequest_reference_practitioner_unresolved.sql" AS metric_path,
    "medicationrequest_reference_practitioner_unresolved" AS metric_name,
    "Proportion of MedicationRequest resources that reference a non-existent practitioner" AS description,
    "MedReq ref. Prac - non-exist" AS short_description,
    "MedicationRequest" AS primary_resource,
    
    [ 'requester.practitionerId' ]
     AS primary_fields,
    
    [ 'Practitioner' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "MedicationRequest.authoredOn" AS metric_date_field,
    "Medication request initial authored date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication request (active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the medication request (inpatient | outpatient | community | discharge)" AS dimension_b_description,
    "intent" AS dimension_c,
    "The intent of the medication request (proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/encounter_count_by_end_date.sql" AS metric_path,
    "encounter_count_by_end_date" AS metric_name,
    "Count of encounters ending during each day" AS description,
    "Discharged encounters" AS short_description,
    "Encounter" AS primary_resource,
    
    [ 'period.end' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Encounter daily" AS category,
    "COUNT" AS calculation,
    "Encounter.period.end" AS metric_date_field,
    "Encounter end date" AS metric_date_description,
    "latest_encounter_class" AS dimension_a,
    "The latest class of the encounter" AS dimension_a_description,
    "encounter_service_provider" AS dimension_b,
    "The organization responsible for providing the services for this encounter" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/active_patients_with_servicerequest_daily.sql" AS metric_path,
    "active_patients_with_servicerequest_daily" AS metric_name,
    "Proportion of active patients with at least one service request that day" AS description,
    "Patients with ServiceRequest" AS short_description,
    "ServiceRequest" AS primary_resource,
    
    [ 'subject.patientId' , 'encounter.encounterId' , 'authoredOn' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Active patients with resource" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "encounter_class_group" AS dimension_a,
    "The latest class of the encounter grouped into ambulatory or non-ambulatory" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/careteam_reference_practitioner_undefined.sql" AS metric_path,
    "careteam_reference_practitioner_undefined" AS metric_name,
    "Proportion of CareTeam resources that do not have a practitioner reference recorded" AS description,
    "CareTeam ref. Prac - unrecorded" AS short_description,
    "CareTeam" AS primary_resource,
    
    [ 'participant.member.practitionerId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "CareTeam.period.start" AS metric_date_field,
    "Start of time period covered by care team" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the care team (proposed | active | suspended | inactive | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationrequest_reference_medicationrequest_undefined.sql" AS metric_path,
    "medicationrequest_reference_medicationrequest_undefined" AS metric_name,
    "Proportion of MedicationRequest resources that do not have a parent medication request reference recorded" AS description,
    "MedReq ref. MedReq - unrecorded" AS short_description,
    "MedicationRequest" AS primary_resource,
    
    [ 'requester.practitionerId' , 'basedOn.medicationRequestId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "MedicationRequest.authoredOn" AS metric_date_field,
    "Medication request initial authored date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication request (active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the medication request (inpatient | outpatient | community | discharge)" AS dimension_b_description,
    "intent" AS dimension_c,
    "The intent of the medication request (proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/composition_reference_encounter_unresolved.sql" AS metric_path,
    "composition_reference_encounter_unresolved" AS metric_name,
    "Proportion of Composition resources that reference a non-existent encounter" AS description,
    "Comp ref. Enc - non-exist" AS short_description,
    "Composition" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Composition.date" AS metric_date_field,
    "Composition latest edit date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the composition (preliminary | final | amended | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/patient_missing_dob.sql" AS metric_path,
    "patient_missing_dob" AS metric_name,
    "Proportion of patients that have missing birthdate" AS description,
    "Patients missing dob" AS short_description,
    "Patient" AS primary_resource,
    
    [ 'birthdate' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "active" AS dimension_a,
    "The patient active status  (true | false)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationadministration_dosage_dose_rate.sql" AS metric_path,
    "medicationadministration_dosage_dose_rate" AS metric_name,
    "Proportion of medication administrations with dosage dose or rate recorded" AS description,
    "MedAdmin dose or rate recorded" AS short_description,
    "MedicationAdministration" AS primary_resource,
    
    [ 'dosage.dose' , 'dosage.rate' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(MedicationAdministration.effective.period.start, MedicationAdministration.effective.dateTime)" AS metric_date_field,
    "MedicationAdministration effective period start date (if absent, MedicationAdministration effective date)" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationadministration_reference_patient_undefined.sql" AS metric_path,
    "medicationadministration_reference_patient_undefined" AS metric_name,
    "Proportion of MedicationAdministration resources that do not have a patient reference recorded" AS description,
    "MedAdmin ref. Patient - unrecorded" AS short_description,
    "MedicationAdministration" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(MedicationAdministration.effective.period.start, MedicationAdministration.effective.dateTime)" AS metric_date_field,
    "MedicationAdministration effective period start date (if absent, MedicationAdministration effective date)" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication administration (in-progress | not-done | on-hold | completed | entered-in-error | stopped | unknown)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationdispense_dosage_dose_rate.sql" AS metric_path,
    "medicationdispense_dosage_dose_rate" AS metric_name,
    "Proportion of medication dispenses with dosage dose and rate recorded" AS description,
    "MedDisp dose and rate recorded" AS short_description,
    "MedicationDispense" AS primary_resource,
    
    [ 'dosageInstruction.doseAndRate' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "MedicationDispense.whenPrepared" AS metric_date_field,
    "Date when the dispensed medication was packaged and reviewed" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationstatement_reference_medication_unresolved.sql" AS metric_path,
    "medicationstatement_reference_medication_unresolved" AS metric_name,
    "Proportion of MedicationStatement resources that reference a non-existent medication" AS description,
    "MedStat ref. Med - non-exist" AS short_description,
    "MedicationStatement" AS primary_resource,
    
    [ 'medication.reference.medicationId' ]
     AS primary_fields,
    
    [ 'Medication' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "MedicationStatement.dateAsserted" AS metric_date_field,
    "Medication statement asserted date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication statement (active | completed | entered-in-error | intended | stopped | on-hold | unknown | not-taken)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/composition_with_type_text.sql" AS metric_path,
    "composition_with_type_text" AS metric_name,
    "Proportion of Composition resources that contain a non-empty type.text" AS description,
    "Comp with type.text" AS short_description,
    "Composition" AS primary_resource,
    
    [ 'type.text' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "date" AS metric_date_field,
    "Composition date" AS metric_date_description,
    "composition_status" AS dimension_a,
    "The composition status  (preliminary | final | amended | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/allergyintolerance_reference_patient_undefined.sql" AS metric_path,
    "allergyintolerance_reference_patient_undefined" AS metric_name,
    "Proportion of AllergyIntolerance resources that do not have a patient reference recorded" AS description,
    "Allergy ref. Patient - unrecorded" AS short_description,
    "AllergyIntolerance" AS primary_resource,
    
    [ 'patient.patientId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "AllergyIntolerance.recordedDate" AS metric_date_field,
    "Allergy or intolerance recorded date" AS metric_date_description,
    "clinical_status" AS dimension_a,
    "The clinical status of the allergy/intollerance (active | inactive | resolved)" AS dimension_a_description,
    "verification_status" AS dimension_b,
    "The verification status of the allergy/intollerance (unconfirmed | confirmed | refuted | entered-in-error)" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationrequest_reference_practitioner_undefined.sql" AS metric_path,
    "medicationrequest_reference_practitioner_undefined" AS metric_name,
    "Proportion of MedicationRequest resources that do not have a requester practitioner reference recorded" AS description,
    "MedReq ref. Prac - unrecorded" AS short_description,
    "MedicationRequest" AS primary_resource,
    
    [ 'requester.practitionerId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "MedicationRequest.authoredOn" AS metric_date_field,
    "Medication request initial authored date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication request (active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the medication request (inpatient | outpatient | community | discharge)" AS dimension_b_description,
    "intent" AS dimension_c,
    "The intent of the medication request (proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationstatement_reference_patient_unresolved.sql" AS metric_path,
    "medicationstatement_reference_patient_unresolved" AS metric_name,
    "Proportion of MedicationStatement resources that reference a non-existent patient" AS description,
    "MedStat ref. Patient - non-exist" AS short_description,
    "MedicationStatement" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    
    [ 'Patient' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "MedicationStatement.dateAsserted" AS metric_date_field,
    "Medication statement asserted date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication statement (active | completed | entered-in-error | intended | stopped | on-hold | unknown | not-taken)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/patient_count.sql" AS metric_path,
    "patient_count" AS metric_name,
    "Count of valid Patient resources" AS description,
    "Patient resources" AS short_description,
    "Patient" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "Encounter.period.start" AS metric_date_field,
    "Encounter start date of patient's earliest clinical encounter" AS metric_date_description,
    "active" AS dimension_a,
    "Whether this patient's record is in active use" AS dimension_a_description,
    "gender" AS dimension_b,
    "The patient's gender (male, female, other, unknown)" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationadministration_count.sql" AS metric_path,
    "medicationadministration_count" AS metric_name,
    "Count of valid MedicationAdministration resources" AS description,
    "MedicationAdministration resources" AS short_description,
    "MedicationAdministration" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "MedicationAdministration.effective.dateTime" AS metric_date_field,
    "MedicationAdministration effective date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication administration (in-progress | not-done | on-hold | completed | entered-in-error | stopped | unknown)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationadministration_reference_medicationrequest_unresolved.sql" AS metric_path,
    "medicationadministration_reference_medicationrequest_unresolved" AS metric_name,
    "Proportion of MedicationAdministration resources that reference a non-existent medication request" AS description,
    "MedAdmin ref. MedReq - non-exist" AS short_description,
    "MedicationAdministration" AS primary_resource,
    
    [ 'context.encounterId' , 'request.medicationRequestId' ]
     AS primary_fields,
    
    [ 'MedicationRequest' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(MedicationAdministration.effective.period.start, MedicationAdministration.effective.dateTime)" AS metric_date_field,
    "MedicationAdministration effective period start date (if absent, MedicationAdministration effective date)" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication administration (in-progress | not-done | on-hold | completed | entered-in-error | stopped | unknown)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/practitioner_count.sql" AS metric_path,
    "practitioner_count" AS metric_name,
    "Count of valid Practitioner resources" AS description,
    "Practitioner resources" AS short_description,
    "Practitioner" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "active" AS dimension_a,
    "Whether this practitioner's record is in active use" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/diagnosticreport_with_attachment.sql" AS metric_path,
    "diagnosticreport_with_attachment" AS metric_name,
    "Proportion of DiagnosticReport resources that contain inlined attachment" AS description,
    "DR with inlined attachment" AS short_description,
    "DiagnosticReport" AS primary_resource,
    
    [ 'presentedForm.data' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "issued" AS metric_date_field,
    "DiagnosticReport issued date" AS metric_date_description,
    "status" AS dimension_a,
    "The report status  (preliminary | final | amended | entered-in-error +)" AS dimension_a_description,
    "category" AS dimension_b,
    "The service category of the diagnostic report" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationrequest_dosage_instruction.sql" AS metric_path,
    "medicationrequest_dosage_instruction" AS metric_name,
    "Proportion of medication requests with dosage instruction text recorded" AS description,
    "MedReq instruction recorded" AS short_description,
    "MedicationRequest" AS primary_resource,
    
    [ 'dosageInstruction.patientInstruction' , 'dosageInstruction.text' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "MedicationRequest.authoredOn" AS metric_date_field,
    "Medication request initial authored date" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/active_patients_with_observation_daily.sql" AS metric_path,
    "active_patients_with_observation_daily" AS metric_name,
    "Proportion of active patients with at least one observation that day" AS description,
    "Patients with Obs" AS short_description,
    "Observation" AS primary_resource,
    
    [ 'subject.patientId' , 'encounter.encounterId' , 'effective.dateTime' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Active patients with resource" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "encounter_class_group" AS dimension_a,
    "The latest class of the encounter grouped into ambulatory or non-ambulatory" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/composition_count.sql" AS metric_path,
    "composition_count" AS metric_name,
    "Count of valid Composition resources" AS description,
    "Composition resources" AS short_description,
    "Composition" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "Composition.date" AS metric_date_field,
    "Composition latest edit date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the composition (preliminary | final | amended | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationrequest_reference_medication_unresolved.sql" AS metric_path,
    "medicationrequest_reference_medication_unresolved" AS metric_name,
    "Proportion of MedicationRequest resources that reference a non-existent medication" AS description,
    "MedReq ref. Med - non-exist" AS short_description,
    "MedicationRequest" AS primary_resource,
    
    [ 'requester.practitionerId' , 'medication.reference.medicationId' ]
     AS primary_fields,
    
    [ 'Medication' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "MedicationRequest.authoredOn" AS metric_date_field,
    "Medication request initial authored date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication request (active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the medication request (inpatient | outpatient | community | discharge)" AS dimension_b_description,
    "intent" AS dimension_c,
    "The intent of the medication request (proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationadministration_reference_encounter_unresolved.sql" AS metric_path,
    "medicationadministration_reference_encounter_unresolved" AS metric_name,
    "Proportion of MedicationAdministration resources that reference a non-existent encounter" AS description,
    "MedAdmin ref. Enc - non-exist" AS short_description,
    "MedicationAdministration" AS primary_resource,
    
    [ 'context.encounterId' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(MedicationAdministration.effective.period.start, MedicationAdministration.effective.dateTime)" AS metric_date_field,
    "MedicationAdministration effective period start date (if absent, MedicationAdministration effective date)" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication administration (in-progress | not-done | on-hold | completed | entered-in-error | stopped | unknown)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/diagnosticreport_reference_practitioner_undefined.sql" AS metric_path,
    "diagnosticreport_reference_practitioner_undefined" AS metric_name,
    "Proportion of DiagnosticReport resources that do not have a practitioner reference recorded" AS description,
    "DiagRep ref. Prac - unrecorded" AS short_description,
    "DiagnosticReport" AS primary_resource,
    
    [ 'performer.practitionerId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "DiagnosticReport.issued" AS metric_date_field,
    "Diagnostic report latest version issue date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the diagnostic report (registered | partial | preliminary | final +)" AS dimension_a_description,
    "category" AS dimension_b,
    "The service category of the diagnostic report" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/servicerequest_reference_encounter_undefined.sql" AS metric_path,
    "servicerequest_reference_encounter_undefined" AS metric_name,
    "Proportion of ServiceRequest resources that do not have an encounter reference recorded" AS description,
    "SerReq ref. Enc - unrecorded" AS short_description,
    "ServiceRequest" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "ServiceRequest.authoredOn" AS metric_date_field,
    "Service request signed date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the service request (draft | active | on-hold | revoked | completed | entered-in-error | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the service request" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationstatement_reference_medication_undefined.sql" AS metric_path,
    "medicationstatement_reference_medication_undefined" AS metric_name,
    "Proportion of MedicationStatement resources that do not have an medication reference recorded" AS description,
    "MedStat ref. Med - unrecorded" AS short_description,
    "MedicationStatement" AS primary_resource,
    
    [ 'medication.reference.medicationId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "MedicationStatement.dateAsserted" AS metric_date_field,
    "Medication statement asserted date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication statement (active | completed | entered-in-error | intended | stopped | on-hold | unknown | not-taken)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/questionnaireresponse_invalid_choice.sql" AS metric_path,
    "questionnaireresponse_invalid_choice" AS metric_name,
    "QuestionnaireResponse records with invalid answer choices" AS description,
    "QuestionnaireResponse invalid choice" AS short_description,
    "QuestionnaireResponse" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    
    [ 'Questionnaire' ]
     AS secondary_resources,
    "" AS category,
    "" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/diagnosticreport_reference_servicerequest_undefined.sql" AS metric_path,
    "diagnosticreport_reference_servicerequest_undefined" AS metric_name,
    "Proportion of DiagnosticReport resources that do not have a service request reference recorded" AS description,
    "DiagRep ref. SerReq - unrecorded" AS short_description,
    "DiagnosticReport" AS primary_resource,
    
    [ 'basedOn.serviceRequestId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "DiagnosticReport.issued" AS metric_date_field,
    "Diagnostic report latest version issue date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the diagnostic report (registered | partial | preliminary | final +)" AS dimension_a_description,
    "category" AS dimension_b,
    "The service category of the diagnostic report" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/documentreference_reference_patient_undefined.sql" AS metric_path,
    "documentreference_reference_patient_undefined" AS metric_name,
    "Proportion of DocumentReference resources that do not have a patient reference recorded" AS description,
    "DocRef ref. Patient - unrecorded" AS short_description,
    "DocumentReference" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    
    [ 'Patient' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "DocumentReference.date" AS metric_date_field,
    "Document reference date" AS metric_date_description,
    "document_status" AS dimension_a,
    "The document reference status  (current | superseded | entered-in-error)" AS dimension_a_description,
    "format" AS dimension_b,
    "The format of the document referenced (scanned | NULL)" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/procedure_with_code_text.sql" AS metric_path,
    "procedure_with_code_text" AS metric_name,
    "Proportion of Procedure resources that contain a non-empty code.text" AS description,
    "Procedure with code.text" AS short_description,
    "Procedure" AS primary_resource,
    
    [ 'code.text' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(performed.period.start, performed.dateTime)" AS metric_date_field,
    "Procedure performed datetime" AS metric_date_description,
    "status" AS dimension_a,
    "The procedure status bound to http://hl7.org/fhir/event-status" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/careteam_reference_practitioner_unresolved.sql" AS metric_path,
    "careteam_reference_practitioner_unresolved" AS metric_name,
    "Proportion of CareTeam resources that reference a non-existent practitioner" AS description,
    "CareTeam ref. Prac - non-exist" AS short_description,
    "CareTeam" AS primary_resource,
    
    [ 'participant.member.practitionerId' ]
     AS primary_fields,
    
    [ 'Practitioner' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "CareTeam.period.start" AS metric_date_field,
    "Start of time period covered by care team" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the care team (proposed | active | suspended | inactive | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/location_count.sql" AS metric_path,
    "location_count" AS metric_name,
    "Count of valid Location resources" AS description,
    "Location resources" AS short_description,
    "Location" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the location (active | suspended | inactive)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/condition_with_code_text.sql" AS metric_path,
    "condition_with_code_text" AS metric_name,
    "Proportion of Condition resources that contain a non-empty code.text" AS description,
    "Condition with code.text" AS short_description,
    "Condition" AS primary_resource,
    
    [ 'code.text' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "recordedDate" AS metric_date_field,
    "Condition recorded date" AS metric_date_description,
    "clinical_status" AS dimension_a,
    "The condition status bound to http://terminology.hl7.org/CodeSystem/condition-clinical" AS dimension_a_description,
    "verification_status" AS dimension_b,
    "The condition verification status bound to http://terminology.hl7.org/CodeSystem/condition-ver-status" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/diagnosticreport_reference_practitioner_unresolved.sql" AS metric_path,
    "diagnosticreport_reference_practitioner_unresolved" AS metric_name,
    "Proportion of DiagnosticReport resources that reference a non-existent practitioner" AS description,
    "DiagRep ref. Prac - non-exist" AS short_description,
    "DiagnosticReport" AS primary_resource,
    
    [ 'performer.practitionerId' ]
     AS primary_fields,
    
    [ 'Practitioner' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "DiagnosticReport.issued" AS metric_date_field,
    "Diagnostic report latest version issue date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the diagnostic report (registered | partial | preliminary | final +)" AS dimension_a_description,
    "category" AS dimension_b,
    "The service category of the diagnostic report" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/careteam_reference_encounter_unresolved.sql" AS metric_path,
    "careteam_reference_encounter_unresolved" AS metric_name,
    "Proportion of CareTeam resources that reference a non-existent encounter" AS description,
    "CareTeam ref. Enc - non-exist" AS short_description,
    "CareTeam" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "CareTeam.period.start" AS metric_date_field,
    "Start of time period covered by care team" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the care team (proposed | active | suspended | inactive | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/diagnosticreport_reference_encounter_undefined.sql" AS metric_path,
    "diagnosticreport_reference_encounter_undefined" AS metric_name,
    "Proportion of DiagnosticReport resources that do not have an encounter reference recorded" AS description,
    "DiagRep ref. Enc - unrecorded" AS short_description,
    "DiagnosticReport" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "DiagnosticReport.issued" AS metric_date_field,
    "Diagnostic report latest version issue date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the diagnostic report (registered | partial | preliminary | final +)" AS dimension_a_description,
    "category" AS dimension_b,
    "The service category of the diagnostic report" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/composition_reference_encounter_undefined.sql" AS metric_path,
    "composition_reference_encounter_undefined" AS metric_name,
    "Proportion of Composition resources that do not have an encounter reference recorded" AS description,
    "Comp ref. Enc - unrecorded" AS short_description,
    "Composition" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Composition.date" AS metric_date_field,
    "Composition latest edit date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the composition (preliminary | final | amended | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/procedure_count.sql" AS metric_path,
    "procedure_count" AS metric_name,
    "Count of valid Procedure resources" AS description,
    "Procedure resources" AS short_description,
    "Procedure" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "COALESCE(Procedure.performed.period.start, Procedure.performed.dateTime)" AS metric_date_field,
    "Procedure performed period start date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the procedure (preparation | in-progress | not-done | on-hold | stopped | completed | entered-in-error | unknown)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/careteam_reference_patient_unresolved.sql" AS metric_path,
    "careteam_reference_patient_unresolved" AS metric_name,
    "Proportion of CareTeam resources that reference a non-existent patient" AS description,
    "CareTeam ref. Patient - non-exist" AS short_description,
    "CareTeam" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    
    [ 'Patient' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "CareTeam.period.start" AS metric_date_field,
    "Start of time period covered by care team" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the care team (proposed | active | suspended | inactive | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/active_patients_with_medicationrequest_daily.sql" AS metric_path,
    "active_patients_with_medicationrequest_daily" AS metric_name,
    "Proportion of active patients with at least one medication request that day" AS description,
    "Patients with MedicationRequest" AS short_description,
    "MedicationRequest" AS primary_resource,
    
    [ 'subject.patientId' , 'encounter.encounterId' , 'authoredOn' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Active patients with resource" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "encounter_class_group" AS dimension_a,
    "The latest class of the encounter grouped into ambulatory or non-ambulatory" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/documentreference_reference_practitioner_unresolved.sql" AS metric_path,
    "documentreference_reference_practitioner_unresolved" AS metric_name,
    "Proportion of DocumentReference resources that reference a non-existent practitioner" AS description,
    "DocRef ref. Prac - non-exist" AS short_description,
    "DocumentReference" AS primary_resource,
    
    [ 'author.practitionerId' ]
     AS primary_fields,
    
    [ 'Practitioner' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "DocumentReference.date" AS metric_date_field,
    "Document reference date" AS metric_date_description,
    "document_status" AS dimension_a,
    "The document reference status  (current | superseded | entered-in-error)" AS dimension_a_description,
    "format" AS dimension_b,
    "The format of the document referenced (scanned | NULL)" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/active_patients_with_allergyintolerance.sql" AS metric_path,
    "active_patients_with_allergyintolerance" AS metric_name,
    "Proportion of active patients with at least one allergy or intolerance recorded at any time" AS description,
    "Patients with AllergyIntol" AS short_description,
    "AllergyIntolerance" AS primary_resource,
    
    [ 'patient.patientId' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Active patients with resource" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "encounter_class_group" AS dimension_a,
    "The latest class of the encounter grouped into ambulatory or non-ambulatory" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/composition_reference_binary_unresolved.sql" AS metric_path,
    "composition_reference_binary_unresolved" AS metric_name,
    "Proportion of Composition resources that reference a non-existent binary resource" AS description,
    "Comp ref. Binary - non-exist" AS short_description,
    "Composition" AS primary_resource,
    
    [ 'section.entry.binaryId' ]
     AS primary_fields,
    
    [ 'Binary' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Composition.date" AS metric_date_field,
    "Composition latest edit date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the composition (preliminary | final | amended | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/encounter_reference_location_unresolved.sql" AS metric_path,
    "encounter_reference_location_unresolved" AS metric_name,
    "Proportion of Encounter resources that reference a non-existent location" AS description,
    "Enc ref. Loc - non-exist" AS short_description,
    "Encounter" AS primary_resource,
    
    [ 'location.location.locationId' ]
     AS primary_fields,
    
    [ 'Location' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Encounter.period.start" AS metric_date_field,
    "Encounter start date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the encounter (planned | arrived | triaged | in-progress | onleave | finished | cancelled +)" AS dimension_a_description,
    "latest_encounter_class" AS dimension_b,
    "The latest class of the encounter" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/composition_reference_patient_unresolved.sql" AS metric_path,
    "composition_reference_patient_unresolved" AS metric_name,
    "Proportion of Composition resources that reference a non-existent patient" AS description,
    "Comp ref. Patient - non-exist" AS short_description,
    "Composition" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    
    [ 'Patient' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Composition.date" AS metric_date_field,
    "Composition latest edit date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the composition (preliminary | final | amended | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/procedure_reference_patient_undefined.sql" AS metric_path,
    "procedure_reference_patient_undefined" AS metric_name,
    "Proportion of LDA Procedure resources that do not have a patient reference recorded" AS description,
    "LDA Proc ref. Patient - unrecorded" AS short_description,
    "Procedure" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(Procedure.performed.period.start, Procedure.performed.dateTime)" AS metric_date_field,
    "Procedure performed period start date (if absent, procedure performed date)" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the procedure (preparation | in-progress | not-done | on-hold | stopped | completed | entered-in-error | unknown)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/servicerequest_reference_servicerequest_unresolved.sql" AS metric_path,
    "servicerequest_reference_servicerequest_unresolved" AS metric_name,
    "Proportion of ServiceRequest resources that reference a non-existent service request" AS description,
    "SerReq ref. SerReq - non-exist" AS short_description,
    "ServiceRequest" AS primary_resource,
    
    [ 'requester.practitionerId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "ServiceRequest.authoredOn" AS metric_date_field,
    "Service request signed date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the service request (draft | active | on-hold | revoked | completed | entered-in-error | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the service request" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/allergyintolerance_reference_encounter_unresolved.sql" AS metric_path,
    "allergyintolerance_reference_encounter_unresolved" AS metric_name,
    "Proportion of AllergyIntolerance resources that reference a non-existent encounter" AS description,
    "Allergy ref. Enc - non-exist" AS short_description,
    "AllergyIntolerance" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "AllergyIntolerance.recordedDate" AS metric_date_field,
    "Allergy or intolerance recorded date" AS metric_date_description,
    "clinical_status" AS dimension_a,
    "The clinical status of the allergy/intollerance (active | inactive | resolved)" AS dimension_a_description,
    "verification_status" AS dimension_b,
    "The verification status of the allergy/intollerance (unconfirmed | confirmed | refuted | entered-in-error)" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/patient_inactive.sql" AS metric_path,
    "patient_inactive" AS metric_name,
    "Proportion of patients that are inactive" AS description,
    "Inactive patients" AS short_description,
    "Patient" AS primary_resource,
    
    [ 'active' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data distribution" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/active_patients_with_diagnosticreport_daily.sql" AS metric_path,
    "active_patients_with_diagnosticreport_daily" AS metric_name,
    "Proportion of active patients with at least one diagnostic report that day" AS description,
    "Patients with DiagnosticReport" AS short_description,
    "DiagnosticReport" AS primary_resource,
    
    [ 'subject.patientId' , 'encounter.encounterId' , 'issued' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Active patients with resource" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "encounter_class_group" AS dimension_a,
    "The latest class of the encounter grouped into ambulatory or non-ambulatory" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationadministration_dosage_instruction.sql" AS metric_path,
    "medicationadministration_dosage_instruction" AS metric_name,
    "Proportion of medication administrations with dosage instruction text recorded" AS description,
    "MedAdmin instruction recorded" AS short_description,
    "MedicationAdministration" AS primary_resource,
    
    [ 'dosage.text' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(MedicationAdministration.effective.period.start, MedicationAdministration.effective.dateTime)" AS metric_date_field,
    "MedicationAdministration effective period start date (if absent, MedicationAdministration effective date)" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/organization_count.sql" AS metric_path,
    "organization_count" AS metric_name,
    "Count of valid Organization resources" AS description,
    "Organization resources" AS short_description,
    "Organization" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "active" AS dimension_a,
    "Whether this organization is active" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/active_encounters_daily.sql" AS metric_path,
    "active_encounters_daily" AS metric_name,
    "Count of inpatient encounters that are active at any time during each day" AS description,
    "Active encounters" AS short_description,
    "Encounter" AS primary_resource,
    
    [ 'period.start' , 'period.end' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Encounter daily" AS category,
    "COUNT" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "encounter_class" AS dimension_a,
    "The latest class of the encounter" AS dimension_a_description,
    "encounter_service_provider" AS dimension_b,
    "The organization responsible for providing the services for this encounter" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/patient_missing_encounter.sql" AS metric_path,
    "patient_missing_encounter" AS metric_name,
    "Proportion of patients that do not have an encounter" AS description,
    "Patients missing encounters" AS short_description,
    "Patient" AS primary_resource,
    
    [ 'active' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "active" AS dimension_a,
    "The patient active status  (true | false)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/diagnosticreport_with_binary_unresolved.sql" AS metric_path,
    "diagnosticreport_with_binary_unresolved" AS metric_name,
    "Proportion of DiagnosticReport resources that contain a binary reference that resolves" AS description,
    "DR with binary content" AS short_description,
    "DiagnosticReport" AS primary_resource,
    
    [ 'presentedForm.url' ]
     AS primary_fields,
    
    [ 'Binary' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "issued" AS metric_date_field,
    "DiagnosticReport issued date" AS metric_date_description,
    "status" AS dimension_a,
    "The report status  (preliminary | final | amended | entered-in-error +)" AS dimension_a_description,
    "category" AS dimension_b,
    "The service category of the diagnostic report" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/procedure_reference_patient_unresolved.sql" AS metric_path,
    "procedure_reference_patient_unresolved" AS metric_name,
    "Proportion of LDA Procedure resources that reference a non-existent patient" AS description,
    "LDA Proc ref. Patient - non-exist" AS short_description,
    "Procedure" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    
    [ 'Patient' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(Procedure.performed.period.start, Procedure.performed.dateTime)" AS metric_date_field,
    "Procedure performed period start date (if absent, procedure performed date)" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the procedure (preparation | in-progress | not-done | on-hold | stopped | completed | entered-in-error | unknown)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/resource_hour_distribution.sql" AS metric_path,
    "resource_hour_distribution" AS metric_name,
    "Distribution of resource counts by time of day" AS description,
    "Resource hour distribution" AS short_description,
    "Encounter" AS primary_resource,
    
    [ 'period.start' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data distribution" AS category,
    "COUNT" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "hour_of_day" AS dimension_a,
    "The hour of the day of the clinical timestamp of a resource" AS dimension_a_description,
    "resource" AS dimension_b,
    "The relevant resource used to extract the timestamp" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/encounter_reference_location_undefined.sql" AS metric_path,
    "encounter_reference_location_undefined" AS metric_name,
    "Proportion of Encounter resources that do not have a location reference recorded" AS description,
    "Enc ref. Loc - unrecorded" AS short_description,
    "Encounter" AS primary_resource,
    
    [ 'location.location.locationId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Encounter.period.start" AS metric_date_field,
    "Encounter start date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the encounter (planned | arrived | triaged | in-progress | onleave | finished | cancelled +)" AS dimension_a_description,
    "latest_encounter_class" AS dimension_b,
    "The latest class of the encounter" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/encounter_reference_patient_unresolved.sql" AS metric_path,
    "encounter_reference_patient_unresolved" AS metric_name,
    "Proportion of Encounter resources that reference a non-existent patient" AS description,
    "Enc ref. Patient - non-exist" AS short_description,
    "Encounter" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    
    [ 'Patient' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Encounter.period.start" AS metric_date_field,
    "Encounter start date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the encounter (planned | arrived | triaged | in-progress | onleave | finished | cancelled +)" AS dimension_a_description,
    "latest_encounter_class" AS dimension_b,
    "The latest class of the encounter" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/composition_with_section_text_div.sql" AS metric_path,
    "composition_with_section_text_div" AS metric_name,
    "Proportion of Composition resources that contain a non-empty section[].text.div" AS description,
    "Comp with section div" AS short_description,
    "Composition" AS primary_resource,
    
    [ 'section.text.div' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "date" AS metric_date_field,
    "Composition date" AS metric_date_description,
    "composition_status" AS dimension_a,
    "The composition status  (preliminary | final | amended | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/binary_count.sql" AS metric_path,
    "binary_count" AS metric_name,
    "Count of valid Binary resources" AS description,
    "Binary resources" AS short_description,
    "Binary" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "Composition.date" AS metric_date_field,
    "Composition latest edit date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the composition (preliminary | final | amended | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/diagnosticreport_performer_specialty.sql" AS metric_path,
    "diagnosticreport_performer_specialty" AS metric_name,
    "Proportion of diagnostic reports referencing a practioner role with specialty recorded" AS description,
    "DiagRep prac. specialty recorded" AS short_description,
    "DiagnosticReport" AS primary_resource,
    
    [ 'performer' ]
     AS primary_fields,
    
    [ 'Practitioner' , 'PractitionerRole' ]
     AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "DiagnosticReport.issued" AS metric_date_field,
    "Diagnostic report latest version issue date" AS metric_date_description,
    "category" AS dimension_a,
    "The service category of the diagnostic report" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/documentreference_reference_patient_unresolved.sql" AS metric_path,
    "documentreference_reference_patient_unresolved" AS metric_name,
    "Proportion of DocumentReference resources that reference a non-existent patient" AS description,
    "DocRef ref. Patient - non-exist" AS short_description,
    "DocumentReference" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    
    [ 'Patient' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "DocumentReference.date" AS metric_date_field,
    "Document reference date" AS metric_date_description,
    "document_status" AS dimension_a,
    "The document reference status  (current | superseded | entered-in-error)" AS dimension_a_description,
    "format" AS dimension_b,
    "The format of the document referenced (scanned | NULL)" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationrequest_reference_encounter_undefined.sql" AS metric_path,
    "medicationrequest_reference_encounter_undefined" AS metric_name,
    "Proportion of MedicationRequest resources that do not have an encounter reference recorded" AS description,
    "MedReq ref. Enc - unrecorded" AS short_description,
    "MedicationRequest" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "MedicationRequest.authoredOn" AS metric_date_field,
    "Medication request initial authored date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication request (active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the medication request (inpatient | outpatient | community | discharge)" AS dimension_b_description,
    "intent" AS dimension_c,
    "The intent of the medication request (proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medication_count.sql" AS metric_path,
    "medication_count" AS metric_name,
    "Count of valid Medication resources" AS description,
    "Medication resources" AS short_description,
    "Medication" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication (active | inactive | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/active_encounters_midnight_census.sql" AS metric_path,
    "active_encounters_midnight_census" AS metric_name,
    "Count of patients that have an active inpatient encounter at midnight each day" AS description,
    "Census" AS short_description,
    "Encounter" AS primary_resource,
    
    [ 'classHistory.period.start' , 'classHistory.period.end' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Encounter daily" AS category,
    "COUNT" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "episode_class" AS dimension_a,
    "The class of the encounter episode" AS dimension_a_description,
    "encounter_service_provider" AS dimension_b,
    "The organization responsible for providing the services for this encounter" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/allergyintolerance_reference_encounter_undefined.sql" AS metric_path,
    "allergyintolerance_reference_encounter_undefined" AS metric_name,
    "Proportion of AllergyIntolerance resources that do not have an encounter reference recorded" AS description,
    "Allergy ref. Enc - unrecorded" AS short_description,
    "AllergyIntolerance" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "AllergyIntolerance.recordedDate" AS metric_date_field,
    "Allergy or intolerance recorded date" AS metric_date_description,
    "clinical_status" AS dimension_a,
    "The clinical status of the allergy/intollerance (active | inactive | resolved)" AS dimension_a_description,
    "verification_status" AS dimension_b,
    "The verification status of the allergy/intollerance (unconfirmed | confirmed | refuted | entered-in-error)" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/diagnosticreport_with_code_text.sql" AS metric_path,
    "diagnosticreport_with_code_text" AS metric_name,
    "Proportion of DiagnosticReport resources that contain a non-empty code.text" AS description,
    "DR with code.text" AS short_description,
    "DiagnosticReport" AS primary_resource,
    
    [ 'code.text' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "issued" AS metric_date_field,
    "Diagnostic Report issued date" AS metric_date_description,
    "status" AS dimension_a,
    "The report status  (preliminary | final | amended | entered-in-error +)" AS dimension_a_description,
    "category" AS dimension_b,
    "The service category of the diagnostic report" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationrequest_dosage_dose_rate.sql" AS metric_path,
    "medicationrequest_dosage_dose_rate" AS metric_name,
    "Proportion of medication requests with dosage dose and rate recorded" AS description,
    "MedReq dose and rate recorded" AS short_description,
    "MedicationRequest" AS primary_resource,
    
    [ 'dosageInstruction.doseAndRate' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "MedicationRequest.authoredOn" AS metric_date_field,
    "Medication request initial authored date" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/diagnosticreport_reference_servicerequest_unresolved.sql" AS metric_path,
    "diagnosticreport_reference_servicerequest_unresolved" AS metric_name,
    "Proportion of DiagnosticReport resources that reference a non-existent service request" AS description,
    "DiagRep ref. SerReq - non-exist" AS short_description,
    "DiagnosticReport" AS primary_resource,
    
    [ 'basedOn.serviceRequestId' ]
     AS primary_fields,
    
    [ 'ServiceRequest' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "DiagnosticReport.issued" AS metric_date_field,
    "Diagnostic report latest version issue date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the diagnostic report (registered | partial | preliminary | final +)" AS dimension_a_description,
    "category" AS dimension_b,
    "The service category of the diagnostic report" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/careteam_count.sql" AS metric_path,
    "careteam_count" AS metric_name,
    "Count of valid CareTeam resources" AS description,
    "CareTeam resources" AS short_description,
    "CareTeam" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "CareTeam.period.start" AS metric_date_field,
    "Start of time period covered by care team" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the care team (proposed | active | suspended | inactive | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/patient_testpatient.sql" AS metric_path,
    "patient_testpatient" AS metric_name,
    "Proportion of patients that are flagged as test patients" AS description,
    "Test patients" AS short_description,
    "Patient" AS primary_resource,
    
    [ 'meta.security.system' , 'meta.security.code' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/patient_name_missing.sql" AS metric_path,
    "patient_name_missing" AS metric_name,
    "Proportion of patients without structured name" AS description,
    "Patients missing struct name" AS short_description,
    "Patient" AS primary_resource,
    
    [ 'name.family' , 'name.given' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "active" AS dimension_a,
    "Whether this patient record is in active use" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/person_reference_patient_unresolved.sql" AS metric_path,
    "person_reference_patient_unresolved" AS metric_name,
    "Proportion of Person resources that do not contain at least one reference to an existing patient" AS description,
    "Person ref. Patient - non-exist" AS short_description,
    "Person" AS primary_resource,
    
    [ 'link.target.patientId' ]
     AS primary_fields,
    
    [ 'Patient' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "person_active" AS dimension_a,
    "The person active status  (true | false)" AS dimension_a_description,
    "person_gender" AS dimension_b,
    "The gender of the person (male | female | other | unknown)" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/active_patients_with_medicationstatement.sql" AS metric_path,
    "active_patients_with_medicationstatement" AS metric_name,
    "Proportion of active patients with at least one medication statement recorded at any time" AS description,
    "Patients with MedStatement" AS short_description,
    "MedicationStatement" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Active patients with resource" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "encounter_class_group" AS dimension_a,
    "The latest class of the encounter grouped into ambulatory or non-ambulatory" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/questionnaire_count.sql" AS metric_path,
    "questionnaire_count" AS metric_name,
    "Count of valid Questionnaire resources" AS description,
    "Questionnaire resources" AS short_description,
    "Questionnaire" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "Questionnaire.date" AS metric_date_field,
    "Questionnaire date" AS metric_date_description,
    "questionnaire_group.title" AS dimension_a,
    "The title of the questionnaire (The Basics | Lifestyle +)" AS dimension_a_description,
    "status" AS dimension_b,
    "The status of the questionnaire (published | +)" AS dimension_b_description,
    "version" AS dimension_c,
    "The version of the questionnaire ( V2022.11.17 | v2020.09.25 +)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/allergyintolerance_reference_patient_unresolved.sql" AS metric_path,
    "allergyintolerance_reference_patient_unresolved" AS metric_name,
    "Proportion of AllergyIntolerance resources that reference a non-existent patient" AS description,
    "Allergy ref. Patient - non-exist" AS short_description,
    "AllergyIntolerance" AS primary_resource,
    
    [ 'patient.patientId' ]
     AS primary_fields,
    
    [ 'Patient' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "AllergyIntolerance.recordedDate" AS metric_date_field,
    "Allergy or intolerance recorded date" AS metric_date_description,
    "clinical_status" AS dimension_a,
    "The clinical status of the allergy/intollerance (active | inactive | resolved)" AS dimension_a_description,
    "verification_status" AS dimension_b,
    "The verification status of the allergy/intollerance (unconfirmed | confirmed | refuted | entered-in-error)" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationadministration_reference_encounter_undefined.sql" AS metric_path,
    "medicationadministration_reference_encounter_undefined" AS metric_name,
    "Proportion of MedicationAdministration resources that do not have an encounter reference recorded" AS description,
    "MedAdmin ref. Enc - unrecorded" AS short_description,
    "MedicationAdministration" AS primary_resource,
    
    [ 'context.encounterId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(MedicationAdministration.effective.period.start, MedicationAdministration.effective.dateTime)" AS metric_date_field,
    "MedicationAdministration effective period start date (if absent, MedicationAdministration effective date)" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication administration (in-progress | not-done | on-hold | completed | entered-in-error | stopped | unknown)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/observation_quantity_unit.sql" AS metric_path,
    "observation_quantity_unit" AS metric_name,
    "Proportion of observations with a value that have a unit recorded" AS description,
    "Obs value unit recorded" AS short_description,
    "Observation" AS primary_resource,
    
    [ 'value.quantity.unit' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "Observation.effective.dateTime" AS metric_date_field,
    "Observation effective date" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/practitionerrole_count.sql" AS metric_path,
    "practitionerrole_count" AS metric_name,
    "Count of valid PractitionerRole resources" AS description,
    "PractitionerRole resources" AS short_description,
    "PractitionerRole" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "active" AS dimension_a,
    "Whether this practitioner role record is in active use" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationstatement_reference_encounter_unresolved.sql" AS metric_path,
    "medicationstatement_reference_encounter_unresolved" AS metric_name,
    "Proportion of MedicationStatement resources that reference a non-existent encounter" AS description,
    "MedStat ref. Enc - non-exist" AS short_description,
    "MedicationStatement" AS primary_resource,
    
    [ 'context.encounterId' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "MedicationStatement.dateAsserted" AS metric_date_field,
    "Medication statement asserted date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication statement (active | completed | entered-in-error | intended | stopped | on-hold | unknown | not-taken)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/documentreference_distribution_type.sql" AS metric_path,
    "documentreference_distribution_type" AS metric_name,
    "Distribution of values for DocumentReference type" AS description,
    "DocRef Type Dist" AS short_description,
    "DocumentReference" AS primary_resource,
    
    [ 'type.coding.system' , 'type.coding.code' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data distribution" AS category,
    "COUNT" AS calculation,
    "DocumentReference.date" AS metric_date_field,
    "Document reference date" AS metric_date_description,
    "document_status" AS dimension_a,
    "The document reference status  (current | superseded | entered-in-error)" AS dimension_a_description,
    "format" AS dimension_b,
    "The format of the document referenced (scanned | NULL)" AS dimension_b_description,
    "type" AS dimension_c,
    "The kind of document (LOINC)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/composition_binary_mimetype.sql" AS metric_path,
    "composition_binary_mimetype" AS metric_name,
    "Count of Composition by Binary MIME Type" AS description,
    "Composition Binary MIME Type" AS short_description,
    "Composition" AS primary_resource,
    
    [ 'Composition.section.entry' ]
     AS primary_fields,
    
    [ 'Binary' ]
     AS secondary_resources,
    "Data distribution" AS category,
    "COUNT" AS calculation,
    "Composition.date" AS metric_date_field,
    "Composition date" AS metric_date_description,
    "composition_status" AS dimension_a,
    "The composition status  (preliminary | final | amended | entered-in-error)" AS dimension_a_description,
    "mime_type" AS dimension_b,
    "The media type of the document ({MIME types} | NULL)" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/servicerequest_reference_practitioner_undefined.sql" AS metric_path,
    "servicerequest_reference_practitioner_undefined" AS metric_name,
    "Proportion of ServiceRequest resources that do not have a practitioner reference recorded" AS description,
    "SerReq ref. Prac - unrecorded" AS short_description,
    "ServiceRequest" AS primary_resource,
    
    [ 'requester.practitionerId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "ServiceRequest.authoredOn" AS metric_date_field,
    "Service request signed date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the service request (draft | active | on-hold | revoked | completed | entered-in-error | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the service request" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/servicerequest_reference_encounter_unresolved.sql" AS metric_path,
    "servicerequest_reference_encounter_unresolved" AS metric_name,
    "Proportion of ServiceRequest resources that reference a non-existent encounter" AS description,
    "SerReq ref. Enc - non-exist" AS short_description,
    "ServiceRequest" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "ServiceRequest.authoredOn" AS metric_date_field,
    "Service request signed date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the service request (draft | active | on-hold | revoked | completed | entered-in-error | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the service request" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/careteam_reference_patient_undefined.sql" AS metric_path,
    "careteam_reference_patient_undefined" AS metric_name,
    "Proportion of CareTeam resources that do not have a patient reference recorded" AS description,
    "CareTeam ref. Patient - unrecorded" AS short_description,
    "CareTeam" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    
    [ 'Patient' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "CareTeam.period.start" AS metric_date_field,
    "Start of time period covered by care team" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the care team (proposed | active | suspended | inactive | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/careteam_reference_encounter_undefined.sql" AS metric_path,
    "careteam_reference_encounter_undefined" AS metric_name,
    "Proportion of CareTeam resources that do not have an encounter reference recorded" AS description,
    "CareTeam ref. Enc - unrecorded" AS short_description,
    "CareTeam" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "CareTeam.period.start" AS metric_date_field,
    "Start of time period covered by care team" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the care team (proposed | active | suspended | inactive | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/observation_reference_encounter_unresolved.sql" AS metric_path,
    "observation_reference_encounter_unresolved" AS metric_name,
    "Proportion of Observation resources that reference a non-existent encounter" AS description,
    "Obs ref. Enc - non-exist" AS short_description,
    "Observation" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Observation.effective.dateTime" AS metric_date_field,
    "Observation effective date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the observation (registered | preliminary | final | amended +)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/composition_reference_binary_undefined.sql" AS metric_path,
    "composition_reference_binary_undefined" AS metric_name,
    "Proportion of Composition resources that do not have a binary reference recorded" AS description,
    "Comp ref. Binary - unrecorded" AS short_description,
    "Composition" AS primary_resource,
    
    [ 'section.entry.binaryId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Composition.date" AS metric_date_field,
    "Composition latest edit date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the composition (preliminary | final | amended | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/condition_reference_encounter_unresolved.sql" AS metric_path,
    "condition_reference_encounter_unresolved" AS metric_name,
    "Proportion of Condition resources that reference a non-existent encounter" AS description,
    "Cond ref. Enc - non-exist" AS short_description,
    "Condition" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Condition.recordedDate" AS metric_date_field,
    "Condition recorded date" AS metric_date_description,
    "clinical_status" AS dimension_a,
    "The clinical status of the condition (active | recurrence | relapse | inactive | remission | resolved)" AS dimension_a_description,
    "verification_status" AS dimension_b,
    "The verification status of the condition (unconfirmed | provisional | differential | confirmed | refuted | entered-in-error)" AS dimension_b_description,
    "category" AS dimension_c,
    "The category of the condition (problem-list-item | encounter-diagnosis)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/diagnosticreport_count.sql" AS metric_path,
    "diagnosticreport_count" AS metric_name,
    "Count of valid DiagnosticReport resources" AS description,
    "DiagnosticReport resources" AS short_description,
    "DiagnosticReport" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "DiagnosticReport.issued" AS metric_date_field,
    "Diagnostic report latest version issue date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the diagnostic report (registered | partial | preliminary | final +)" AS dimension_a_description,
    "category" AS dimension_b,
    "The service category of the diagnostic report" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/observation_reference_servicerequest_undefined.sql" AS metric_path,
    "observation_reference_servicerequest_undefined" AS metric_name,
    "Proportion of Observation resources that do not have a service request reference recorded" AS description,
    "Obs ref. SerReq - unrecorded" AS short_description,
    "Observation" AS primary_resource,
    
    [ 'encounter.encounterId' , 'basedOn.serviceRequestId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Observation.effective.dateTime" AS metric_date_field,
    "Observation effective date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the observation (registered | preliminary | final | amended +)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/active_patients_with_medicationadministration_daily.sql" AS metric_path,
    "active_patients_with_medicationadministration_daily" AS metric_name,
    "Proportion of active patients with at least one medication administration that day" AS description,
    "Patients with MedAdmin" AS short_description,
    "MedicationAdministration" AS primary_resource,
    
    [ 'subject.patientId' , 'context.encounterId' , 'effective.period.start' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Active patients with resource" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "encounter_class_group" AS dimension_a,
    "The latest class of the encounter grouped into ambulatory or non-ambulatory" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/composition_reference_practitioner_unresolved.sql" AS metric_path,
    "composition_reference_practitioner_unresolved" AS metric_name,
    "Proportion of Composition resources that reference a non-existent practitioner" AS description,
    "Comp ref. Prac - non-exist" AS short_description,
    "Composition" AS primary_resource,
    
    [ 'author.practitionerId' ]
     AS primary_fields,
    
    [ 'Practitioner' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Composition.date" AS metric_date_field,
    "Composition latest edit date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the composition (preliminary | final | amended | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationadministration_reference_patient_unresolved.sql" AS metric_path,
    "medicationadministration_reference_patient_unresolved" AS metric_name,
    "Proportion of MedicationAdministration resources that reference a non-existent patient" AS description,
    "MedAdmin ref. Patient - non-exist" AS short_description,
    "MedicationAdministration" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    
    [ 'Patient' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(MedicationAdministration.effective.period.start, MedicationAdministration.effective.dateTime)" AS metric_date_field,
    "MedicationAdministration effective period start date (if absent, MedicationAdministration effective date)" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication administration (in-progress | not-done | on-hold | completed | entered-in-error | stopped | unknown)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/diagnosticreport_reference_observation_undefined.sql" AS metric_path,
    "diagnosticreport_reference_observation_undefined" AS metric_name,
    "Proportion of DiagnosticReport resources that do not have an observation reference recorded" AS description,
    "DiagRep ref. Obs - unrecorded" AS short_description,
    "DiagnosticReport" AS primary_resource,
    
    [ 'result.observationId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "DiagnosticReport.issued" AS metric_date_field,
    "Diagnostic report latest version issue date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the diagnostic report (registered | partial | preliminary | final +)" AS dimension_a_description,
    "category" AS dimension_b,
    "The service category of the diagnostic report" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/procedure_reference_practitioner_unresolved.sql" AS metric_path,
    "procedure_reference_practitioner_unresolved" AS metric_name,
    "Proportion of LDA Procedure resources that reference a non-existent practitioner" AS description,
    "LDA Proc ref. Prac - non-exist" AS short_description,
    "Procedure" AS primary_resource,
    
    [ 'performer.actor.practitionerId' ]
     AS primary_fields,
    
    [ 'Practitioner' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(Procedure.performed.period.start, Procedure.performed.dateTime)" AS metric_date_field,
    "Procedure performed period start date (if absent, procedure performed date)" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the procedure (preparation | in-progress | not-done | on-hold | stopped | completed | entered-in-error | unknown)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/diagnosticreport_reference_encounter_unresolved.sql" AS metric_path,
    "diagnosticreport_reference_encounter_unresolved" AS metric_name,
    "Proportion of DiagnosticReport resources that reference a non-existent encounter" AS description,
    "DiagRep ref. Enc - non-exist" AS short_description,
    "DiagnosticReport" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "DiagnosticReport.issued" AS metric_date_field,
    "Diagnostic report latest version issue date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the diagnostic report (registered | partial | preliminary | final +)" AS dimension_a_description,
    "category" AS dimension_b,
    "The service category of the diagnostic report" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/servicerequest_count.sql" AS metric_path,
    "servicerequest_count" AS metric_name,
    "Count of valid ServiceRequest resources" AS description,
    "ServiceRequest resources" AS short_description,
    "ServiceRequest" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "ServiceRequest.authoredOn" AS metric_date_field,
    "Service request signed date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the service request (draft | active | on-hold | revoked | completed | entered-in-error | unknown)" AS dimension_a_description,
    "intent" AS dimension_b,
    "The intent of the service request (proposal | plan | directive | order | original-order | reflex-order | filler-order | instance-order | option)" AS dimension_b_description,
    "category" AS dimension_c,
    "The category of the service request" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/composition_reference_patient_undefined.sql" AS metric_path,
    "composition_reference_patient_undefined" AS metric_name,
    "Proportion of Composition resources that do not have a patient reference recorded" AS description,
    "Comp ref. Patient - unrecorded" AS short_description,
    "Composition" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    
    [ 'Patient' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Composition.date" AS metric_date_field,
    "Composition latest edit date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the composition (preliminary | final | amended | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationadministration_dosage_route.sql" AS metric_path,
    "medicationadministration_dosage_route" AS metric_name,
    "Proportion of medication administrations with dosage route recorded" AS description,
    "MedAdmin route recorded" AS short_description,
    "MedicationAdministration" AS primary_resource,
    
    [ 'dosage.route' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(MedicationAdministration.effective.period.start, MedicationAdministration.effective.dateTime)" AS metric_date_field,
    "MedicationAdministration effective period start date (if absent, MedicationAdministration effective date)" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/documentreference_count.sql" AS metric_path,
    "documentreference_count" AS metric_name,
    "Count of valid DocumentReference resources" AS description,
    "DocumentReference resources" AS short_description,
    "DocumentReference" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "DocumentReference.date" AS metric_date_field,
    "Document reference date" AS metric_date_description,
    "document_status" AS dimension_a,
    "The document reference status  (current | superseded | entered-in-error)" AS dimension_a_description,
    "format" AS dimension_b,
    "The format of the document referenced (scanned | NULL)" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationstatement_dosage_route.sql" AS metric_path,
    "medicationstatement_dosage_route" AS metric_name,
    "Proportion of medication statements with dosage route recorded" AS description,
    "MedState route recorded" AS short_description,
    "MedicationStatement" AS primary_resource,
    
    [ 'dosageInstruction.route' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "MedicationStatement.dateAsserted" AS metric_date_field,
    "Medication statement asserted date" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationadministration_reference_medication_unresolved.sql" AS metric_path,
    "medicationadministration_reference_medication_unresolved" AS metric_name,
    "Proportion of MedicationAdministration resources that reference a non-existent medication" AS description,
    "MedAdmin ref. Med - non-exist" AS short_description,
    "MedicationAdministration" AS primary_resource,
    
    [ 'context.encounterId' , 'medication.reference.medicationId' ]
     AS primary_fields,
    
    [ 'Medication' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(MedicationAdministration.effective.period.start, MedicationAdministration.effective.dateTime)" AS metric_date_field,
    "MedicationAdministration effective period start date (if absent, MedicationAdministration effective date)" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication administration (in-progress | not-done | on-hold | completed | entered-in-error | stopped | unknown)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/composition_reference_practitioner_undefined.sql" AS metric_path,
    "composition_reference_practitioner_undefined" AS metric_name,
    "Proportion of Composition resources that do not have a practitioner reference recorded" AS description,
    "Comp ref. Prac - unrecorded" AS short_description,
    "Composition" AS primary_resource,
    
    [ 'author.practitionerId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Composition.date" AS metric_date_field,
    "Composition latest edit date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the composition (preliminary | final | amended | entered-in-error)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationstatement_dosage_dose_rate.sql" AS metric_path,
    "medicationstatement_dosage_dose_rate" AS metric_name,
    "Proportion of medication statements with dosage dose and rate recorded" AS description,
    "MedState dose and rate recorded" AS short_description,
    "MedicationStatement" AS primary_resource,
    
    [ 'dosageInstruction.doseAndRate' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "MedicationStatement.dateAsserted" AS metric_date_field,
    "Medication statement asserted date" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/diagnosticreport_reference_patient_undefined.sql" AS metric_path,
    "diagnosticreport_reference_patient_undefined" AS metric_name,
    "Proportion of DiagnosticReport resources that do not have a patient reference recorded" AS description,
    "DiagRep ref. Patient - unrecorded" AS short_description,
    "DiagnosticReport" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "DiagnosticReport.issued" AS metric_date_field,
    "Diagnostic report latest version issue date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the diagnostic report (registered | partial | preliminary | final +)" AS dimension_a_description,
    "category" AS dimension_b,
    "The service category of the diagnostic report" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationrequest_reference_patient_undefined.sql" AS metric_path,
    "medicationrequest_reference_patient_undefined" AS metric_name,
    "Proportion of MedicationRequest resources that do not have a patient reference recorded" AS description,
    "MedReq ref. Patient - unrecorded" AS short_description,
    "MedicationRequest" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "MedicationRequest.authoredOn" AS metric_date_field,
    "Medication request initial authored date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication request (active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the medication request (inpatient | outpatient | community | discharge)" AS dimension_b_description,
    "intent" AS dimension_c,
    "The intent of the medication request (proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/diagnosticreport_reference_observation_unresolved.sql" AS metric_path,
    "diagnosticreport_reference_observation_unresolved" AS metric_name,
    "Proportion of DiagnosticReport resources that reference a non-existent observation" AS description,
    "DiagRep ref. Obs - non-exist" AS short_description,
    "DiagnosticReport" AS primary_resource,
    
    [ 'result.observationId' ]
     AS primary_fields,
    
    [ 'Observation' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "DiagnosticReport.issued" AS metric_date_field,
    "Diagnostic report latest version issue date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the diagnostic report (registered | partial | preliminary | final +)" AS dimension_a_description,
    "category" AS dimension_b,
    "The service category of the diagnostic report" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationrequest_dosage_route.sql" AS metric_path,
    "medicationrequest_dosage_route" AS metric_name,
    "Proportion of medication requests with dosage route recorded" AS description,
    "MedReq route recorded" AS short_description,
    "MedicationRequest" AS primary_resource,
    
    [ 'dosageInstruction.route' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "MedicationRequest.authoredOn" AS metric_date_field,
    "Medication request initial authored date" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationdispense_dosage_route.sql" AS metric_path,
    "medicationdispense_dosage_route" AS metric_name,
    "Proportion of medication dispenses with dosage route recorded" AS description,
    "MedDisp route recorded" AS short_description,
    "MedicationDispense" AS primary_resource,
    
    [ 'dosageInstruction.route' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "MedicationDispense.whenPrepared" AS metric_date_field,
    "Date when the dispensed medication was packaged and reviewed" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/observation_reference_servicerequest_unresolved.sql" AS metric_path,
    "observation_reference_servicerequest_unresolved" AS metric_name,
    "Proportion of Observation resources that reference a non-existent service request" AS description,
    "Obs ref. SerReq - non-exist" AS short_description,
    "Observation" AS primary_resource,
    
    [ 'encounter.encounterId' , 'basedOn.serviceRequestId' ]
     AS primary_fields,
    
    [ 'ServiceRequest' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Observation.effective.dateTime" AS metric_date_field,
    "Observation effective date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the observation (registered | preliminary | final | amended +)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/diagnosticreport_with_conclusion.sql" AS metric_path,
    "diagnosticreport_with_conclusion" AS metric_name,
    "Proportion of DiagnosticReport resources that contain a non-empty conclusion" AS description,
    "DR with conclusion" AS short_description,
    "DiagnosticReport" AS primary_resource,
    
    [ 'conclusion' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "issued" AS metric_date_field,
    "DiagnosticReport issued date" AS metric_date_description,
    "status" AS dimension_a,
    "The report status  (preliminary | final | amended | entered-in-error +)" AS dimension_a_description,
    "category" AS dimension_b,
    "The service category of the diagnostic report" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationstatement_dosage_instruction.sql" AS metric_path,
    "medicationstatement_dosage_instruction" AS metric_name,
    "Proportion of medication statements with dosage instruction text recorded" AS description,
    "MedState instruction recorded" AS short_description,
    "MedicationStatement" AS primary_resource,
    
    [ 'dosageInstruction.patientInstruction' , 'dosageInstruction.text' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "MedicationStatement.dateAsserted" AS metric_date_field,
    "Medication statement asserted date" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/procedure_reference_encounter_undefined.sql" AS metric_path,
    "procedure_reference_encounter_undefined" AS metric_name,
    "Proportion of LDA Procedure resources that do not have an encounter reference recorded" AS description,
    "LDA Proc ref. Enc - unrecorded" AS short_description,
    "Procedure" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(Procedure.performed.period.start, Procedure.performed.dateTime)" AS metric_date_field,
    "Procedure performed period start date (if absent, procedure performed date)" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the procedure (preparation | in-progress | not-done | on-hold | stopped | completed | entered-in-error | unknown)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/condition_reference_encounter_undefined.sql" AS metric_path,
    "condition_reference_encounter_undefined" AS metric_name,
    "Proportion of Condition resources that do not have an encounter reference recorded" AS description,
    "Cond ref. Enc - unrecorded" AS short_description,
    "Condition" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Condition.recordedDate" AS metric_date_field,
    "Condition recorded date" AS metric_date_description,
    "clinical_status" AS dimension_a,
    "The clinical status of the condition (active | recurrence | relapse | inactive | remission | resolved)" AS dimension_a_description,
    "verification_status" AS dimension_b,
    "The verification status of the condition (unconfirmed | provisional | differential | confirmed | refuted | entered-in-error)" AS dimension_b_description,
    "category" AS dimension_c,
    "The category of the condition (problem-list-item | encounter-diagnosis)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/observation_reference_patient_unresolved.sql" AS metric_path,
    "observation_reference_patient_unresolved" AS metric_name,
    "Proportion of Observation resources that reference a non-existent patient" AS description,
    "Obs ref. Patient - non-exist" AS short_description,
    "Observation" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    
    [ 'Patient' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Observation.effective.dateTime" AS metric_date_field,
    "Observation effective date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the observation (registered | preliminary | final | amended +)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/observation_reference_encounter_undefined.sql" AS metric_path,
    "observation_reference_encounter_undefined" AS metric_name,
    "Proportion of Observation resources that do not have an encounter reference recorded" AS description,
    "Obs ref. Enc - unrecorded" AS short_description,
    "Observation" AS primary_resource,
    
    [ 'encounter.encounterId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Observation.effective.dateTime" AS metric_date_field,
    "Observation effective date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the observation (registered | preliminary | final | amended +)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/active_patients_with_careteam_daily.sql" AS metric_path,
    "active_patients_with_careteam_daily" AS metric_name,
    "Proportion of active patients with at least one assigned care team that day" AS description,
    "Patients with CareTeam" AS short_description,
    "CareTeam" AS primary_resource,
    
    [ 'subject.patientId' , 'encounter.encounterId' , 'period.start' , 'period.end' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Active patients with resource" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "encounter_class_group" AS dimension_a,
    "The latest class of the encounter grouped into ambulatory or non-ambulatory" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationstatement_count.sql" AS metric_path,
    "medicationstatement_count" AS metric_name,
    "Count of valid MedicationStatement resources" AS description,
    "MedicationStatement resources" AS short_description,
    "MedicationStatement" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "MedicationStatement.dateAsserted" AS metric_date_field,
    "Medication statement asserted date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication statement (active | completed | entered-in-error | intended | stopped | on-hold | unknown | not-taken)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/servicerequest_reference_patient_unresolved.sql" AS metric_path,
    "servicerequest_reference_patient_unresolved" AS metric_name,
    "Proportion of ServiceRequest resources that reference a non-existent patient" AS description,
    "SerReq ref. Patient - non-exist" AS short_description,
    "ServiceRequest" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    
    [ 'Patient' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "ServiceRequest.authoredOn" AS metric_date_field,
    "Service request signed date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the service request (draft | active | on-hold | revoked | completed | entered-in-error | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the service request" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/procedure_reference_practitioner_undefined.sql" AS metric_path,
    "procedure_reference_practitioner_undefined" AS metric_name,
    "Proportion of LDA Procedure resources that do not have a practitioner reference recorded" AS description,
    "LDA Proc ref. Prac - unrecorded" AS short_description,
    "Procedure" AS primary_resource,
    
    [ 'performer.actor.practitionerId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(Procedure.performed.period.start, Procedure.performed.dateTime)" AS metric_date_field,
    "Procedure performed period start date (if absent, procedure performed date)" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the procedure (preparation | in-progress | not-done | on-hold | stopped | completed | entered-in-error | unknown)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationadministration_reference_medication_undefined.sql" AS metric_path,
    "medicationadministration_reference_medication_undefined" AS metric_name,
    "Proportion of MedicationAdministration resources that do not have an medication reference recorded" AS description,
    "MedAdmin ref. Med - unrecorded" AS short_description,
    "MedicationAdministration" AS primary_resource,
    
    [ 'context.encounterId' , 'medication.reference.medicationId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(MedicationAdministration.effective.period.start, MedicationAdministration.effective.dateTime)" AS metric_date_field,
    "MedicationAdministration effective period start date (if absent, MedicationAdministration effective date)" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication administration (in-progress | not-done | on-hold | completed | entered-in-error | stopped | unknown)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/documentreference_mimetype.sql" AS metric_path,
    "documentreference_mimetype" AS metric_name,
    "Count of DocumentReference by MIME Type" AS description,
    "DocRef MIME Type" AS short_description,
    "DocumentReference" AS primary_resource,
    
    [ 'content' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data distribution" AS category,
    "COUNT" AS calculation,
    "DocumentReference.date" AS metric_date_field,
    "Document reference date" AS metric_date_description,
    "document_status" AS dimension_a,
    "The document reference status  (current | superseded | entered-in-error)" AS dimension_a_description,
    "mime_type" AS dimension_b,
    "The media type of the binary (text/html | plain/text | application/rtf)" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationrequest_reference_patient_unresolved.sql" AS metric_path,
    "medicationrequest_reference_patient_unresolved" AS metric_name,
    "Proportion of MedicationRequest resources that reference a non-existent patient" AS description,
    "MedReq ref. Patient - non-exist" AS short_description,
    "MedicationRequest" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    
    [ 'Patient' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "MedicationRequest.authoredOn" AS metric_date_field,
    "Medication request initial authored date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication request (active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the medication request (inpatient | outpatient | community | discharge)" AS dimension_b_description,
    "intent" AS dimension_c,
    "The intent of the medication request (proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/person_count.sql" AS metric_path,
    "person_count" AS metric_name,
    "Count of valid Person resources" AS description,
    "Person resources" AS short_description,
    "Person" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "Encounter.period.start" AS metric_date_field,
    "Encounter start date of person's earliest clinical encounter" AS metric_date_description,
    "active" AS dimension_a,
    "Whether this person's record is in active use" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/condition_count.sql" AS metric_path,
    "condition_count" AS metric_name,
    "Count of valid Condition resources" AS description,
    "Condition resources" AS short_description,
    "Condition" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "Condition.recordedDate" AS metric_date_field,
    "Condition recorded date" AS metric_date_description,
    "clinical_status" AS dimension_a,
    "The clinical status of the condition (active | recurrence | relapse | inactive | remission | resolved)" AS dimension_a_description,
    "verification_status" AS dimension_b,
    "The verification status of the condition (unconfirmed | provisional | differential | confirmed | refuted | entered-in-error)" AS dimension_b_description,
    "category" AS dimension_c,
    "The category of the condition (problem-list-item | encounter-diagnosis)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationdispense_dosage_instruction.sql" AS metric_path,
    "medicationdispense_dosage_instruction" AS metric_name,
    "Proportion of medication dispenses with dosage instruction text recorded" AS description,
    "MedDisp instruction recorded" AS short_description,
    "MedicationDispense" AS primary_resource,
    
    [ 'dosageInstruction.patientInstruction' , 'dosageInstruction.text' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "MedicationDispense.whenPrepared" AS metric_date_field,
    "Date when the dispensed medication was packaged and reviewed" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/condition_reference_patient_undefined.sql" AS metric_path,
    "condition_reference_patient_undefined" AS metric_name,
    "Proportion of Condition resources that do not have a patient reference recorded" AS description,
    "Cond ref. Patient - unrecorded" AS short_description,
    "Condition" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Condition.recordedDate" AS metric_date_field,
    "Condition recorded date" AS metric_date_description,
    "clinical_status" AS dimension_a,
    "The clinical status of the condition (active | recurrence | relapse | inactive | remission | resolved)" AS dimension_a_description,
    "verification_status" AS dimension_b,
    "The verification status of the condition (unconfirmed | provisional | differential | confirmed | refuted | entered-in-error)" AS dimension_b_description,
    "category" AS dimension_c,
    "The category of the condition (problem-list-item | encounter-diagnosis)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/active_patients_with_composition_daily.sql" AS metric_path,
    "active_patients_with_composition_daily" AS metric_name,
    "Proportion of active patients with at least one composition that day" AS description,
    "Patients with Composition" AS short_description,
    "Composition" AS primary_resource,
    
    [ 'subject.patientId' , 'encounter.encounterId' , 'date' ]
     AS primary_fields,
    
    [ 'Encounter' ]
     AS secondary_resources,
    "Active patients with resource" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "encounter_class_group" AS dimension_a,
    "The latest class of the encounter grouped into ambulatory or non-ambulatory" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/diagnosticreport_reference_patient_unresolved.sql" AS metric_path,
    "diagnosticreport_reference_patient_unresolved" AS metric_name,
    "Proportion of DiagnosticReport resources that reference a non-existent patient" AS description,
    "DiagRep ref. Patient - non-exist" AS short_description,
    "DiagnosticReport" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    
    [ 'Patient' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "DiagnosticReport.issued" AS metric_date_field,
    "Diagnostic report latest version issue date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the diagnostic report (registered | partial | preliminary | final +)" AS dimension_a_description,
    "category" AS dimension_b,
    "The service category of the diagnostic report" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/observation_count.sql" AS metric_path,
    "observation_count" AS metric_name,
    "Count of valid Observation resources" AS description,
    "Observation resources" AS short_description,
    "Observation" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "Observation.effective.dateTime" AS metric_date_field,
    "Observation effective date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the observation (registered | preliminary | final | amended +)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationrequest_count.sql" AS metric_path,
    "medicationrequest_count" AS metric_name,
    "Count of valid MedicationRequest resources" AS description,
    "MedicationRequest resources" AS short_description,
    "MedicationRequest" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "MedicationRequest.authoredOn" AS metric_date_field,
    "Allergy or intolerance recorded date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication request (active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown)" AS dimension_a_description,
    "intent" AS dimension_b,
    "The intent (proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option)" AS dimension_b_description,
    "category" AS dimension_c,
    "The category of the medication request (inpatient | outpatient | community | discharge)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/encounter_count_by_start_date.sql" AS metric_path,
    "encounter_count_by_start_date" AS metric_name,
    "Count of encounters starting each day" AS description,
    "Admitted encounters" AS short_description,
    "Encounter" AS primary_resource,
    
    [ 'period.start' , 'classHistory' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Encounter daily" AS category,
    "COUNT" AS calculation,
    "Encounter.period.start" AS metric_date_field,
    "Encounter start date" AS metric_date_description,
    "initial_encounter_class" AS dimension_a,
    "The initial class recorded for the encounter, ignoring pre-admission class (PRENC)" AS dimension_a_description,
    "encounter_service_provider" AS dimension_b,
    "The organization responsible for providing the services for this encounter" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/documentreference_reference_practitioner_undefined.sql" AS metric_path,
    "documentreference_reference_practitioner_undefined" AS metric_name,
    "Proportion of DocumentReference resources that do not have a practitioner reference recorded" AS description,
    "DocRef ref. Prac - unrecorded" AS short_description,
    "DocumentReference" AS primary_resource,
    
    [ 'author.practitionerId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "DocumentReference.date" AS metric_date_field,
    "Document reference date" AS metric_date_description,
    "document_status" AS dimension_a,
    "The document reference status  (current | superseded | entered-in-error)" AS dimension_a_description,
    "format" AS dimension_b,
    "The format of the document referenced (scanned | NULL)" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/allergyintolerance_count.sql" AS metric_path,
    "allergyintolerance_count" AS metric_name,
    "Count of valid AllergyIntolerance resources" AS description,
    "AllergyIntolerance resources" AS short_description,
    "AllergyIntolerance" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "AllergyIntolerance.recordedDate" AS metric_date_field,
    "Allergy or intolerance recorded date" AS metric_date_description,
    "clinical_status" AS dimension_a,
    "The clinical status of the allergy/intollerance (active | inactive | resolved)" AS dimension_a_description,
    "verification_status" AS dimension_b,
    "The verification status of the allergy/intollerance (unconfirmed | confirmed | refuted | entered-in-error)" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationrequest_reference_medication_undefined.sql" AS metric_path,
    "medicationrequest_reference_medication_undefined" AS metric_name,
    "Proportion of MedicationRequest resources that do not have an medication reference recorded" AS description,
    "MedReq ref. Med - unrecorded" AS short_description,
    "MedicationRequest" AS primary_resource,
    
    [ 'requester.practitionerId' , 'medication.reference.medicationId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "MedicationRequest.authoredOn" AS metric_date_field,
    "Medication request initial authored date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication request (active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the medication request (inpatient | outpatient | community | discharge)" AS dimension_b_description,
    "intent" AS dimension_c,
    "The intent of the medication request (proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/encounter_count.sql" AS metric_path,
    "encounter_count" AS metric_name,
    "Count of valid Encounter resources" AS description,
    "Encounter resources" AS short_description,
    "Encounter" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "Encounter.period.start" AS metric_date_field,
    "Encounter start date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the encounter (planned | arrived | triaged | in-progress | onleave | finished | cancelled +)" AS dimension_a_description,
    "latest_encounter_class" AS dimension_b,
    "The latest class of the encounter" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/servicerequest_reference_patient_undefined.sql" AS metric_path,
    "servicerequest_reference_patient_undefined" AS metric_name,
    "Proportion of ServiceRequest resources that do not have a patient reference recorded" AS description,
    "SerReq ref. Patient - unrecorded" AS short_description,
    "ServiceRequest" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "ServiceRequest.authoredOn" AS metric_date_field,
    "Service request signed date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the service request (draft | active | on-hold | revoked | completed | entered-in-error | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the service request" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/servicerequest_reference_servicerequest_undefined.sql" AS metric_path,
    "servicerequest_reference_servicerequest_undefined" AS metric_name,
    "Proportion of ServiceRequest resources that do not have a service request reference recorded" AS description,
    "SerReq ref. SerReq - unrecorded" AS short_description,
    "ServiceRequest" AS primary_resource,
    
    [ 'requester.practitionerId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "ServiceRequest.authoredOn" AS metric_date_field,
    "Service request signed date" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the service request (draft | active | on-hold | revoked | completed | entered-in-error | unknown)" AS dimension_a_description,
    "category" AS dimension_b,
    "The category of the service request" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/observation_quantity_value.sql" AS metric_path,
    "observation_quantity_value" AS metric_name,
    "Proportion of observations with a value recorded" AS description,
    "Obs value recorded" AS short_description,
    "Observation" AS primary_resource,
    
    [ 'value.quantity.value' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "Observation.effective.dateTime" AS metric_date_field,
    "Observation effective date" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/questionnaireresponse_count.sql" AS metric_path,
    "questionnaireresponse_count" AS metric_name,
    "Count of valid QuestionnaireResponse resources" AS description,
    "QuestionnaireResponse resources" AS short_description,
    "QuestionnaireResponse" AS primary_resource,
    
    [ 'id' ]
     AS primary_fields,
    
    [ 'Questionnaire' ]
     AS secondary_resources,
    "Resource count" AS category,
    "COUNT" AS calculation,
    "QuestionnaireResponse.authored" AS metric_date_field,
    "QuestionnaireResponse authored" AS metric_date_description,
    "questionnaire_group.title" AS dimension_a,
    "The title of the questionnaire (The Basics | Lifestyle +)" AS dimension_a_description,
    "status" AS dimension_b,
    "The status of the questionnaire response (completed | +)" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/patient_missing_mrn.sql" AS metric_path,
    "patient_missing_mrn" AS metric_name,
    "Proportion of patients that have missing MRN" AS description,
    "Patients missing MRN" AS short_description,
    "Patient" AS primary_resource,
    
    [ 'identifier.value' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Data completeness" AS category,
    "PROPORTION" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "active" AS dimension_a,
    "The patient active status  (true | false)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/medicationadministration_reference_medicationrequest_undefined.sql" AS metric_path,
    "medicationadministration_reference_medicationrequest_undefined" AS metric_name,
    "Proportion of MedicationAdministration resources that do not have an medication request reference recorded" AS description,
    "MedAdmin ref. MedReq - unrecorded" AS short_description,
    "MedicationAdministration" AS primary_resource,
    
    [ 'context.encounterId' , 'request.medicationRequestId' ]
     AS primary_fields,
    NULL AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "COALESCE(MedicationAdministration.effective.period.start, MedicationAdministration.effective.dateTime)" AS metric_date_field,
    "MedicationAdministration effective period start date (if absent, MedicationAdministration effective date)" AS metric_date_description,
    "status" AS dimension_a,
    "The status of the medication administration (in-progress | not-done | on-hold | completed | entered-in-error | stopped | unknown)" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/condition_reference_patient_unresolved.sql" AS metric_path,
    "condition_reference_patient_unresolved" AS metric_name,
    "Proportion of Condition resources that reference a non-existent patient" AS description,
    "Cond ref. Patient - non-exist" AS short_description,
    "Condition" AS primary_resource,
    
    [ 'subject.patientId' ]
     AS primary_fields,
    
    [ 'Patient' ]
     AS secondary_resources,
    "Referential integrity" AS category,
    "PROPORTION" AS calculation,
    "Condition.recordedDate" AS metric_date_field,
    "Condition recorded date" AS metric_date_description,
    "clinical_status" AS dimension_a,
    "The clinical status of the condition (active | recurrence | relapse | inactive | remission | resolved)" AS dimension_a_description,
    "verification_status" AS dimension_b,
    "The verification status of the condition (unconfirmed | provisional | differential | confirmed | refuted | entered-in-error)" AS dimension_b_description,
    "category" AS dimension_c,
    "The category of the condition (problem-list-item | encounter-diagnosis)" AS dimension_c_description
UNION ALL
SELECT
    "metrics/data_quality/documentreference_binary_mimetype.sql" AS metric_path,
    "documentreference_binary_mimetype" AS metric_name,
    "Count of DocumentReference by Binary MIME Type" AS description,
    "DocRef Binary MIME Type" AS short_description,
    "DocumentReference" AS primary_resource,
    
    [ 'content' ]
     AS primary_fields,
    
    [ 'Binary' ]
     AS secondary_resources,
    "Data distribution" AS category,
    "COUNT" AS calculation,
    "DocumentReference.date" AS metric_date_field,
    "Document reference date" AS metric_date_description,
    "document_status" AS dimension_a,
    "The document reference status  (current | superseded | entered-in-error)" AS dimension_a_description,
    "mime_type" AS dimension_b,
    "The media type of the document (binary | image/png | NULL)" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/intermediate/questionnaire_answer_key.sql" AS metric_path,
    "questionnaire_answer_key" AS metric_name,
    "Allowed answer options for choice-type questions in all questionnaires" AS description,
    "Questionnaire answer key" AS short_description,
    "Questionnaire" AS primary_resource,
    
    ARRAY<INT64>[]
     AS primary_fields,
    NULL AS secondary_resources,
    "" AS category,
    "" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
UNION ALL
SELECT
    "metrics/intermediate/questionnaireresponse_answer_index.sql" AS metric_path,
    "questionnaireresponse_answer_index" AS metric_name,
    "Coded answer values in all questionnaire responses" AS description,
    "QuestionnaireResponse answer index" AS short_description,
    "QuestionnaireResponse" AS primary_resource,
    
    ARRAY<INT64>[]
     AS primary_fields,
    NULL AS secondary_resources,
    "" AS category,
    "" AS calculation,
    "" AS metric_date_field,
    "" AS metric_date_description,
    "" AS dimension_a,
    "" AS dimension_a_description,
    "" AS dimension_b,
    "" AS dimension_b_description,
    "" AS dimension_c,
    "" AS dimension_c_description
