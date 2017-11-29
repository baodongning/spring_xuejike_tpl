<#-- @ftlvariable name="btn" type="com.bidanet.springmvc.demo.jkbuilder.annotation.JkButton" -->
<#if form.title()!="">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>${form.title()!}</legend>
</fieldset>
</#if>

<form class="layui-form" action="${form.url()!}">
    <#list formFieldList as formField>
    <div class="layui-form-item">
        ${formField.type.html(formField)}
    </div>
    </#list>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <#list btns as btn>

                    <#switch btn.type()>
                        <#case "submit">
                            <button class="layui-btn ${btn.cssClass()}" lay-submit="" lay-filter="ajax_submit">${btn.value()!}</button>
                        <#break>
                        <#case "reset">
                            <button type="reset" class="layui-btn ${btn.cssClass()}">${btn.value()!}</button>
                        <#break >
                        <#default>

                    </#switch>
                </#list>


            </div>
        </div>

    <script>
        layui.use(['form'], function(){
            var form = layui.form;

            //监听提交
            form.on('submit(ajax_submit)', function(data){
                setTimeout(function(){
                    ajaxPost(data.form.action,data.field);
                },1);


                return false;
            });
        });
    </script>
</form>