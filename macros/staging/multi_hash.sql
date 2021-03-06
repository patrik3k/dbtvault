{#- Copyright 2019 Business Thinking LTD. trading as Datavault

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
-#}
{%- macro multi_hash(triples) -%}
-- Generated by dbtvault. Copyright 2019 Business Thinking LTD. trading as Datavault
SELECT
{% for triple in triples -%}
    {%- if triple | length == 2 -%}

    {{ dbtvault.hash(triple[0], triple[1]) }}

    {%- elif triple | length == 3 and triple | last == true -%}

    {{ dbtvault.hash(triple[0], triple[1], triple[2]) }}

    {%- endif -%}

    {% if not loop.last -%}, {% endif %}
{%- endfor -%}
{%- endmacro -%}
