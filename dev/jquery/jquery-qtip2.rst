==============
qTip2 笔记
==============

Tips & Tricks
--------------

动态绑定元素触发qtip2
~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: javascript

    // We'll encapsulate our .qtip() call in your .live() handler method
    $('.selector').live('mouseover', function(event) {
        // Bind the qTip within the event handler
        $(this).qtip({
            overwrite: false, // Make sure the tooltip won't be overridden once created
            content: 'I get bound to all my selector elements, past, present and future!',
            show: {
                event: event.type, // Use the same show event as the one that triggered the event handler
                ready: true // Show the tooltip as soon as it's bound, vital so it shows up the first time you hover!
            }
        }, event); // Pass through our original event to qTip
    })


