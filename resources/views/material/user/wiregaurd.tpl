{include file='user/main.tpl'}


<div class="fbtn-container">
    <div class="fbtn-inner">
        <a class="fbtn fbtn-lg fbtn-brand-accent waves-attach waves-circle waves-light" id="createDevice">+</a>
    </div>
</div>


<div aria-hidden="true" class="modal modal-va-middle fade" id="createDeviceModel" role="dialog" tabindex="-1">
    <div class="modal-dialog modal-xs">
        <div class="modal-content">
            <div class="modal-heading">
                <a class="modal-close" data-dismiss="modal">×</a>
                <h2 class="modal-title">创建 WireGuard 设备</h2>
            </div>
            <div class="modal-inner">
                <div class="form-group form-group-label">
                    <label class="floating-label" for="deviceName">设备名称</label>
                    <input class="form-control maxwidth-edit" id="deviceName" type="text">
                </div>
            </div>
            <div class="modal-footer">
                <p class="text-right">
                    <button class="btn btn-flat btn-brand waves-attach" id="createDeviceSubmit" type="button">确定</button>
                </p>
            </div>
        </div>
    </div>
</div>

<script>
    $("#createDevice").click(function () {
         $("#createDeviceModel").modal();
    })
</script>

<main class="content">
    <div class="content-header ui-content-header">
        <div class="container">
            <h1 class="content-heading">WireGuard 设备</h1>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-12 col-md-12">
            <section class="content-inner margin-top-no">
                <div class="col-xx-12">
                    <div class="card">
                        <div class="card-main">
                            <div class="card-inner">
                                <div class="card-table">
                                    <div class="table-responsive bgc-fix table-user">
                                        {$render}
                                        <table class="table">
                                            <tr>
                                                <th>设备名称</th>
                                                <th>设备 IP</th>
                                                <th>设备公钥</th>
                                                <th>最后一次握手时间</th>
                                            </tr>
                                            {foreach $devices as $device}
                                                {if $device != null}
                                                    <tr>
                                                        <td>{$device->device_name}</td>
                                                        <td>{$device->ip()}</td>
                                                        <td>{$device->public_key}</td>
                                                        <td>{date('Y-m-d H:i:s',$log->last_handshake)}</td>
                                                    </tr>
                                                {/if}
                                            {/foreach}
                                        </table>
                                        {$render}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                {include file='dialog.tpl'}
            </section>
        </div>
    </div>
</main>

<script>

</script>

{include file='user/footer.tpl'}
