$.datetimepicker.setLocale('ko');

$('#datetimepicker').datetimepicker({
    dayOfWeekStart: 1,
    startDate: new Date(),
    minDateTime: new Date()
});
//
//
// $(document).ready(function () {
//     $('#new_appointment').bootstrapValidator({
//         // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
//         feedbackIcons: {
//             valid: 'glyphicon glyphicon-ok',
//             invalid: 'glyphicon glyphicon-remove',
//             validating: 'glyphicon glyphicon-refresh'
//         },
//         fields: {
//             title: {
//                 validators: {
//                     notEmpty: {
//                         message: 'Please supply title'
//                     }
//                 }
//             },
//             content: {
//                 validators: {
//                     notEmpty: {
//                         message: 'Please supply content'
//                     }
//                 }
//             },
//             deadliine: {
//                 validators: {
//                     notEmpty: {
//                         message: 'Please supply deadline'
//                     }
//                 }
//             },
//             // email: {
//             //     validators: {
//             //         notEmpty: {
//             //             message: 'Please supply your email address'
//             //         },
//             //         emailAddress: {
//             //             message: 'Please supply a valid email address'
//             //         }
//             //     }
//             // },
//             // phone: {
//             //     validators: {
//             //         notEmpty: {
//             //             message: 'Please supply your phone number'
//             //         },
//             //         phone: {
//             //             country: 'KO',
//             //             message: 'Please supply a vaild phone number with area code'
//             //         }
//             //     }
//             // },
//
//         }
//     })
//         .on('success.form.bv', function (e) {
//             $('#success_message').slideDown({opacity: "show"}, "slow") // Do something ...
//             $('#new_appointment').data('bootstrapValidator').resetForm();
//
//             // Prevent form submission
//             e.preventDefault();
//
//             // Get the form instance
//             var $form = $(e.target);
//
//             // Get the BootstrapValidator instance
//             var bv = $form.data('bootstrapValidator');
//
//             // Use Ajax to submit form data
//             $.post($form.attr('action'), $form.serialize(), function (result) {
//                 console.log(result);
//             }, 'json');
//         });
// });
