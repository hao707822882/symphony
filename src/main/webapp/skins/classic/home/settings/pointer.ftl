<#include "macro-settings.ftl">
<@home "pointer">

<div class="module">
    <div class="module-header">
        <h2>${pointTransferTipLabel}</h2>
        <span class="fn-right ft-green">
            ♦ <a class="ft-green" href="${servePath}/charge/point">${chargePointLabel}</a>
        </span>
    </div>
    <div class="module-panel form fn-clear">
        <br/>
        <input id="pointTransferUserName" type="text" placeholder="${userNameLabel}"/>
        <br/> <br/>
        <input id="pointTransferAmount" type="number" placeholder="${amountLabel}"/> <br/><br/>
        <div id="pointTransferTip" class="tip"></div> <br/>
        <button class="red fn-right" onclick="Settings.pointTransfer('${csrfToken}')">${confirmTransferLabel}</button>
    </div>
</div>
</@home>